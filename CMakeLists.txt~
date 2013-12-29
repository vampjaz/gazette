# Check http://webdev.elementaryos.org/docs/developer-guide/cmake for documentation

set (NAME gazette)

project (${NAME})
cmake_minimum_required (VERSION 2.8)
cmake_policy (VERSION 2.6)

list (APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake/vala)

set (CMAKE_INSTALL_PREFIX /usr)

#enable_testing ()

set (DATADIR "${CMAKE_INSTALL_PREFIX}/share")
set (PKGDATADIR "${DATADIR}/${NAME}")
set (GETTEXT_PACKAGE "${NAME}")
set (RELEASE_NAME "Simple and functional.")
set (VERSION "0.1")
set (VERSION_INFO "Release")
set (CMAKE_C_FLAGS "-ggdb")
set (PREFIX ${CMAKE_INSTALL_PREFIX})
set (DOLLAR "$")

list (APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)

configure_file (${CMAKE_SOURCE_DIR}/src/Config.vala.cmake ${CMAKE_BINARY_DIR}/src/Config.vala)
add_definitions(-DGETTEXT_PACKAGE=\"${GETTEXT_PACKAGE}\")

find_package(PkgConfig)
pkg_check_modules(DEPS REQUIRED goa-1.0 libgdata libsoup-2.4 pantheon granite clutter-gtk-1.0 zeitgeist-1.0)

link_libraries(${DEPS_LIBRARIES})
link_directories(${DEPS_LIBRARY_DIRS})

add_definitions (${DEPS_CFLAGS})

find_package(Vala REQUIRED)
include(ValaVersion)
ensure_vala_version("0.16.0" MINIMUM)

include(ValaPrecompile)
vala_precompile(VALA_C
    src/Gazette.vala
	src/Services/Files.vala
	src/Services/Service.vala
	src/Services/News.vala
	src/Services/Weather.vala
	src/Services/Calendar.vala
        src/Widgets/GazetteWindow.vala
	src/Widgets/ShadowedLabel.vala
    ${CMAKE_BINARY_DIR}/src/Config.vala
PACKAGES
    goa-1.0
    libgdata
    libsoup-2.4
    granite
    clutter-gtk-1.0
    zeitgeist-1.0
    pantheon
OPTIONS
    --vapidir=${CMAKE_CURRENT_SOURCE_DIR}/vapi/
    ${VALAFLAGS}
    #${VERSIONVALAFLAGS}
    )

add_subdirectory (po)
add_subdirectory (src/Plugs)

include(GSettings)
add_schema ("data/org.pantheon.gazette.gschema.xml")

add_executable(${NAME} ${VALA_C})
target_link_libraries(gazette m)

#install(TARGETS ${NAME} RUNTIME DESTINATION /opt/extras.ubuntu.com/${NAME}/bin)
#install (FILES ${CMAKE_BINARY_DIR}/gazette DESTINATION bin)
install (TARGETS gazette RUNTIME DESTINATION bin)
install (FILES data/gazetteweather.ttf DESTINATION share/fonts/truetype)
