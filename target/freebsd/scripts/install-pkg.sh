#!/bin/sh

set -e

pkg install -y \
    autoconf \
    automake \
    bash \
    bzip2 \
    curl \
    gcc \
    git \
    libdrm \
    libepoll-shim \
    libepoxy \
    libudev-devd \
    libinput \
    libtool \
    libX11 \
    libXi \
    libXinerama \
    libxkbfile \
    libxshmfence \
    libXfont2 \
    libxcvt \
    libglvnd \
    libudev-devd \
    mesa-dri \
    mesa-libs \
    meson \
    pixman \
    pkgconf \
    spice-protocol \
    xcb-util-image \
    xcb-util-keysyms \
    xcb-util-renderutil \
    xcb-util-wm \
    xkbcomp \
    xorg-macros \
    xorgproto \
    xtrans \
    devel/evdev-proto

# The FreeBSD `bzip2` package installs libbz2 + headers but, at least on
# this CI image, no bzip2.pc — freetype2's own .pc lists bzip2 in
# Requires.private, so pkgconf's dependency resolution for xfont2 (which
# needs freetype2) fails outright even though the actual library is
# present and perfectly usable. This is a missing-metadata gap in the
# package, not a missing library — synthesize the .pc pkgconf itself
# never shipped, pointing at wherever `pkg` actually placed the files
# (found via `pkg info -l`, not hardcoded, since the exact split between
# base-system and /usr/local varies).
if ! pkg-config --exists bzip2 2>/dev/null; then
    echo "--> bzip2.pc missing from the bzip2 package; synthesizing one"
    bz_hdr=$(pkg info -l bzip2 | grep -m1 '/bzlib\.h$') || true
    bz_lib=$(pkg info -l bzip2 | grep -m1 '/libbz2\.so$') || true
    bz_incdir=$(dirname "${bz_hdr:-/usr/local/include/bzlib.h}")
    bz_libdir=$(dirname "${bz_lib:-/usr/local/lib/libbz2.so}")
    bz_ver=$(pkg info bzip2 2>/dev/null | awk -F'[-:]' '/^Version/ {print $2; exit}')
    pcdir=/usr/local/libdata/pkgconfig
    mkdir -p "$pcdir"
    cat > "$pcdir/bzip2.pc" <<EOF
prefix=/usr/local
libdir=$bz_libdir
includedir=$bz_incdir

Name: bzip2
Description: bzip2 compression library
Version: ${bz_ver:-1.0.8}
Libs: -L\${libdir} -lbz2
Cflags: -I\${includedir}
EOF
    echo "--> wrote $pcdir/bzip2.pc:"
    cat "$pcdir/bzip2.pc"
fi
