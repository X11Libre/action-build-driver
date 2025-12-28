#!/bin/sh

set -e

pkg install -y \
    autoconf \
    automake \
    bash \
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
    xcb-util-image \
    xcb-util-keysyms \
    xcb-util-renderutil \
    xcb-util-wm \
    xkbcomp \
    xorg-macros \
    xorgproto \
    xtrans \
    devel/evdev-proto

