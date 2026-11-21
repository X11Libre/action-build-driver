#!/bin/sh

set -e
set -x

# Keep pkg's downloads in the workspace, which action.yml caches.
export PKG_CACHEDIR="$PWD/.pkg-cache"
mkdir -p "$PKG_CACHEDIR"

$GITHUB_ACTION_PATH/scripts/install-pkg.sh
# Drop outdated package versions so the cache doesn't keep growing.
pkg clean -y
$GITHUB_ACTION_PATH/scripts/install-prereq.sh
$GITHUB_ACTION_PATH/scripts/build-xserver-sdk.sh
$GITHUB_ACTION_PATH/scripts/build-driver.sh
