
# include me in other scripts

export X11_PREFIX="${HOME}/x11"
export X11_BUILD_DIR="${HOME}/build-deps"
export MACHINE=`gcc -dumpmachine`
export PKG_CONFIG_PATH="${X11_PREFIX}/share/pkgconfig:${X11_PREFIX}/lib/${MACHINE}/pkgconfig:${X11_PREFIX}/lib/pkgconfig:${PKG_CONFIG_PATH}"
export MESON_BUILDDIR="build"
