liri_add_module(DBusService
    DESCRIPTION
        "D-Bus activation for Qt applications"
    SOURCES
        dbusservice.cpp
        dbusservice.h
        dbusservice_p.h
    DBUS_ADAPTOR_SOURCES
        org.freedesktop.Application.xml
    FORWARDING_HEADERS
        DBusService
    PRIVATE_HEADERS
        dbusservice_p.h
    DEFINES
        QT_NO_CAST_FROM_ASCII
        QT_NO_FOREACH
    PUBLIC_LIBRARIES
        Qt5::Core
        Qt5::DBus
        Qt5::Gui
    PKGCONFIG_DEPENDENCIES
        Qt5Core
        Qt5DBus
        Qt5Gui
)
