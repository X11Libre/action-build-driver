#!/bin/sh

set -e
set -x

. $GITHUB_ACTION_PATH/scripts/conf.sh

export CFLAGS="$CFLAGS -Wno-typedef-redefinition"
export MESON_ARGS="-Dc_args=-fno-common -Dprefix=/usr -Dnamespace=false -Dxselinux=false -Dxephyr=false -Dwerror=false -Dxcsecurity=false -Dxorg=true -Dxvfb=false -Dxnest=false -Ddocs=false"

cd xserver-sdk
meson setup "$MESON_BUILDDIR" $MESON_ARGS
meson configure "$MESON_BUILDDIR"
meson compile -v -C "$MESON_BUILDDIR" $jobcount $ninja_args
meson install --no-rebuild  -C "$MESON_BUILDDIR" $MESON_INSTALL_ARGS
