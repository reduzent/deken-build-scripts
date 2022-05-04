#!/bin/bash
. _common_vars

library=fluidsynth~
librarydir=${pdsrcdir}/fluidsynth
version=$(sed -n \
      's|^\#X text [0-9][0-9]* [0-9][0-9]* VERSION \(.*\);|\1|p' \
      ${librarydir}/${library}-meta.pd)
localdep=true
MAKEFLAGS="$MAKEFLAGS LD_LIBRARY_PATH=/home/roman/.local/lib"

. _common_build
