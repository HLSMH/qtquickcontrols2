# Generated from qtquickcontrols2.pro.

cmake_minimum_required(VERSION 3.15.0)

project(QtQuickControls2
    VERSION 6.0.0
    DESCRIPTION "Qt QuickControls2 Libraries"
    HOMEPAGE_URL "https://qt.io/"
    LANGUAGES CXX C
)

find_package(Qt6 ${PROJECT_VERSION} CONFIG REQUIRED COMPONENTS BuildInternals Core Gui Widgets Network Qml Quick QmlTools # special case
                                           OPTIONAL_COMPONENTS QuickTest # special case
)
if(NOT TARGET Qt::Quick)
    message(NOTICE "Skipping the build as the condition \"TARGET Qt::Quick\" is not met.")
    return()
endif()
qt_build_repo()
