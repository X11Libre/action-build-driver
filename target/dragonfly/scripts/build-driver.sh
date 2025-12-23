#!/bin/sh

. $GITHUB_ACTION_PATH/scripts/conf.sh

set -e
set -x

export CFLAGS="$CFLAGS -Wall"

./autogen.sh --prefix=$X11_PREFIX
make -j${CI_CONCURRENT:-4}
