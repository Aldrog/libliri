#!/bin/bash

set -e

source /usr/local/share/liri-travis/functions

# Install libqtxdg
# It uses Qt private API but it's not built by KDE Neon CI therefore it
# still needs ABI of the original Ubuntu packages and doesn't work
travis_start "libqtxdg"
mkdir travis-deps
pushd travis-deps >/dev/null
git clone -b 3.1.0 git://github.com/lxqt/libqtxdg
cd libqtxdg
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr ..
make -j$(nproc)
sudo make install
popd >/dev/null
travis_end "libqtxdg"

# Install artifacts
travis_start "artifacts"
msg "Install artifacts..."
/usr/local/bin/liri-download-artifacts $TRAVIS_BRANCH qbs-shared-artifacts.tar.gz
travis_end "artifacts"

# Configure qbs
travis_start "qbs_setup"
msg "Setup qbs..."
qbs setup-toolchains --detect
qbs setup-qt $(which qmake) travis-qt5
qbs config profiles.travis-qt5.baseProfile $CC
travis_end "qbs_setup"

# Build
travis_start "build"
msg "Build..."
dbus-run-session -- \
xvfb-run -a -s "-screen 0 800x600x24" \
qbs -d build -j $(nproc) --all-products profile:travis-qt5 \
    modules.lirideployment.prefix:/usr \
    modules.lirideployment.libDir:/usr/lib/x86_64-linux-gnu \
    modules.lirideployment.qmlDir:/usr/lib/x86_64-linux-gnu/qt5/qml \
    modules.lirideployment.pluginsDir:/usr/lib/x86_64-linux-gnu/qt5/plugins
travis_end "build"