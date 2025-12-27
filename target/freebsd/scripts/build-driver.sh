#!/bin/sh

. $GITHUB_ACTION_PATH/scripts/conf.sh

set -e
set -x

export CFLAGS="$CFLAGS -Wall"

echo "---> $0: scanning for xi.pc"
find / -name xi.pc

mkdir -p m4

./autogen.sh --prefix=$X11_PREFIX
make -j${CI_CONCURRENT:-4}
