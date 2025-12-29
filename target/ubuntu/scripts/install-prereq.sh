#!/bin/bash

set -e

. $GITHUB_ACTION_PATH/scripts/conf.sh
. $GITHUB_ACTION_PATH/scripts/util.sh

mkdir -p $X11_BUILD_DIR
cd $X11_BUILD_DIR

build_meson drm         $(fdo_mirror drm)           libdrm-2.4.121      ""  -Domap=enabled -Dfreedreno=enabled
build_meson libxcvt     $(fdo_mirror libxcvt)       libxcvt-0.1.0
build_ac    xorgproto   $(fdo_mirror xorgproto)     xorgproto-2024.1
