set(wxWidgets_ROOT_DIR "${CMAKE_CURRENT_LIST_DIR}/../.." CACHE INTERNAL "" FORCE)
set(WX_ROOT_DIR "${wxWidgets_ROOT_DIR}")
set(wxWidgets_LIB_DIR "${wxWidgets_ROOT_DIR}/lib" CACHE INTERNAL "" FORCE)
set(WX_LIB_DIR "${wxWidgets_LIB_DIR}")
find_library(WX_based NAMES wxbase31ud PATHS "${wxWidgets_ROOT_DIR}/debug/lib" NO_DEFAULT_PATH)
file(GLOB WX_DEBUG_LIBS "${wxWidgets_ROOT_DIR}/debug/lib/wx*d_*.lib")
foreach(WX_DEBUG_LIB ${WX_DEBUG_LIBS})
    string(REGEX REPLACE ".*wx([^/]*)d_([^/\\.]*)\\.[^/\\.]*\$" "WX_\\2d" varname "${WX_DEBUG_LIB}")
    set(${varname} "${WX_DEBUG_LIB}" CACHE INTERNAL "" FORCE)
endforeach()
_find_package(${ARGS})
find_package(ZLIB QUIET)
find_package(libpng CONFIG QUIET)
find_package(TIFF QUIET)
find_package(expat CONFIG QUIET)

if(wxWidgets_LIBRARIES AND NOT wxWidgets_LIBRARIES MATCHES "TIFF::TIFF;png;expat::expat;ZLIB::ZLIB")
    list(APPEND wxWidgets_LIBRARIES "TIFF::TIFF;expat::expat;ZLIB::ZLIB")

    if (TARGET png)
        list(APPEND wxWidgets_LIBRARIES "png")
    elseif(TARGET png_static)
        list(APPEND wxWidgets_LIBRARIES "png_static")
    endif()
endif()