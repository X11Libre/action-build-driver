#!/bin/sh

set -e

. $GITHUB_ACTION_PATH/scripts/conf.sh
. $GITHUB_ACTION_PATH/scripts/util.sh

mkdir -p $X11_BUILD_DIR
cd $X11_BUILD_DIR

build_meson libxcvt     $(mirror_url libxcvt)       libxcvt-0.1.0
build_ac    xorgproto   $(mirror_url xorgproto)     xorgproto-2024.1
