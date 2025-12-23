#!/bin/sh

set -e
set -x

$GITHUB_ACTION_PATH/scripts/install-pkg.sh
$GITHUB_ACTION_PATH/scripts/build-xserver-sdk.sh
$GITHUB_ACTION_PATH/scripts/build-driver.sh
