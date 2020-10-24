#!/bin/sh

set -e
set -x
set -u

cd scripts

if test -x build.sh ; then
    ./build.sh
    ./publish.sh
else
    bash -l
fi
