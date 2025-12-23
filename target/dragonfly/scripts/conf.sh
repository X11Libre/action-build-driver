export CI_CONCURRENT=`sysctl -n hw.ncpu`
export MACHINE=`gcc -dumpmachine`

export MESON_BUILDDIR="build"

export X11_PREFIX="${X11_PREFIX:-$HOME/x11}"
export X11_BUILD_DIR="${X11_BUILD_DIR:-$HOME/build-deps}"
export DRV_BUILD_DIR="${DRV_BUILD_DIR:-$HOME/build-drivers}"
export PATH="$X11_PREFIX/bin:$PATH"
export PKG_CONFIG_PATH="/usr/lib/pkgconfig:${X11_PREFIX}/share/pkgconfig:${X11_PREFIX}/lib/${MACHINE}/pkgconfig:${X11_PREFIX}/lib/pkgconfig:${PKG_CONFIG_PATH}"
