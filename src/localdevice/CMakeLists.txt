liri_add_module(LocalDevice
    DESCRIPTION
        "Operations on local device such as reboot, power off, suspend, etc..."
    SOURCES
        localdevicebackend_p.cpp
        localdevicebackend_p_p.h
        localdevice.cpp
        localdevice.h
        localdevice_p.h
        backends/systemdbackend.cpp
        backends/systemdbackend_p.h
        backends/upowerbackend.cpp
        backends/upowerbackend_p.h
    FORWARDING_HEADERS
        LocalDevice
    PRIVATE_HEADERS
        localdevicebackend_p_p.h
        localdevice_p.h
    DEFINES
        QT_NO_CAST_FROM_ASCII
        QT_NO_FOREACH
    PUBLIC_LIBRARIES
        Qt5::Core
        Qt5::DBus
    PKGCONFIG_DEPENDENCIES
        Qt5Core
        Qt5DBus
)
