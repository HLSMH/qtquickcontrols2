# Generated from chapter2-lists.pro.

cmake_minimum_required(VERSION 3.14)
project(chapter2-lists LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

set(INSTALL_EXAMPLEDIR "examples/quickcontrols2/chattutorial/chapter2-lists")

find_package(Qt6 COMPONENTS Core)
find_package(Qt6 COMPONENTS Gui)
find_package(Qt6 COMPONENTS Qml)
find_package(Qt6 COMPONENTS Quick)

add_qt_gui_executable(chapter2-lists
    main.cpp
)
target_link_libraries(chapter2-lists PUBLIC
    Qt::Core
    Qt::Gui
    Qt::Qml
    Qt::Quick
)


# Resources:
set(qml_resource_files
    "main.qml"
)

qt6_add_resources(chapter2-lists "qml"
    PREFIX
        "/"
    FILES
        ${qml_resource_files}
)
set_source_files_properties("../shared/Albert_Einstein.png"
    PROPERTIES QT_RESOURCE_ALIAS "Albert_Einstein.png"
)
set_source_files_properties("../shared/Albert_Einstein@2x.png"
    PROPERTIES QT_RESOURCE_ALIAS "Albert_Einstein@2x.png"
)
set_source_files_properties("../shared/Albert_Einstein@3x.png"
    PROPERTIES QT_RESOURCE_ALIAS "Albert_Einstein@3x.png"
)
set_source_files_properties("../shared/Albert_Einstein@4x.png"
    PROPERTIES QT_RESOURCE_ALIAS "Albert_Einstein@4x.png"
)
set_source_files_properties("../shared/Ernest_Hemingway.png"
    PROPERTIES QT_RESOURCE_ALIAS "Ernest_Hemingway.png"
)
set_source_files_properties("../shared/Ernest_Hemingway@2x.png"
    PROPERTIES QT_RESOURCE_ALIAS "Ernest_Hemingway@2x.png"
)
set_source_files_properties("../shared/Ernest_Hemingway@3x.png"
    PROPERTIES QT_RESOURCE_ALIAS "Ernest_Hemingway@3x.png"
)
set_source_files_properties("../shared/Ernest_Hemingway@4x.png"
    PROPERTIES QT_RESOURCE_ALIAS "Ernest_Hemingway@4x.png"
)
set_source_files_properties("../shared/Hans_Gude.png"
    PROPERTIES QT_RESOURCE_ALIAS "Hans_Gude.png"
)
set_source_files_properties("../shared/Hans_Gude@2x.png"
    PROPERTIES QT_RESOURCE_ALIAS "Hans_Gude@2x.png"
)
set_source_files_properties("../shared/Hans_Gude@3x.png"
    PROPERTIES QT_RESOURCE_ALIAS "Hans_Gude@3x.png"
)
set_source_files_properties("../shared/Hans_Gude@4x.png"
    PROPERTIES QT_RESOURCE_ALIAS "Hans_Gude@4x.png"
)
set(shared_resource_files
    "Albert_Einstein.png"
    "Albert_Einstein@2x.png"
    "Albert_Einstein@3x.png"
    "Albert_Einstein@4x.png"
    "Ernest_Hemingway.png"
    "Ernest_Hemingway@2x.png"
    "Ernest_Hemingway@3x.png"
    "Ernest_Hemingway@4x.png"
    "Hans_Gude.png"
    "Hans_Gude@2x.png"
    "Hans_Gude@3x.png"
    "Hans_Gude@4x.png"
)

qt6_add_resources(chapter2-lists "shared"
    PREFIX
        "/"
    BASE
        "../shared"
    FILES
        ${shared_resource_files}
)

install(TARGETS chapter2-lists
    RUNTIME DESTINATION "${INSTALL_EXAMPLEDIR}"
    BUNDLE DESTINATION "${INSTALL_EXAMPLEDIR}"
    LIBRARY DESTINATION "${INSTALL_EXAMPLEDIR}"
)
