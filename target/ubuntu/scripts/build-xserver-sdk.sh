#!/bin/bash

set -e
set -x

. $GITHUB_ACTION_PATH/scripts/conf.sh

export MESON_ARGS="-Dc_args=-fno-common -Dprefix=/usr -Dnamespace=false -Dxselinux=false -Dxephyr=false -Dwerror=false -Dxcsecurity=false -Dxorg=true -Dxvfb=false -Dxnest=false -Ddocs=false"

cd xserver-sdk
echo -n > .meson_environment
env > .meson_environment
./.github/scripts/meson-build.sh --skip-test
sudo meson install --no-rebuild -C "$MESON_BUILDDIR"
sudo mkdir -p /usr/local/lib/$MACHINE/xorg/modules # /home/runner/x11/lib/xorg/modules
sudo chown -R runner /usr/local/lib/$MACHINE/xorg/modules # /home/runner/x11/lib/xorg/modules
