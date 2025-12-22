#!/bin/bash

. $GITHUB_ACTION_PATH/scripts/ubuntu/env.sh

set -e
set -x

export CFLAGS="$CFLAGS -Wall"

./autogen.sh # --prefix=$X11_PREFIX
make -j # install
