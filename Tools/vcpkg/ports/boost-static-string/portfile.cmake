# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/static_string
    REF boost-1.76.0
    SHA512 cf7908b40eddc0ef478479834ce73f3352c8f29729a77698f9ebfa4fdf944b2aafce82410977764b5bedf4bfc92e000fc2c7c0df4cbdf487e0bb790cd5f35111
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})