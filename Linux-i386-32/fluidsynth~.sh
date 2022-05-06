#!/bin/bash
. _common_vars

library=fluidsynth~
librarydir=${pdsrcdir}/fluidsynth
version=$(sed -n \
      's|^\#X text [0-9][0-9]* [0-9][0-9]* VERSION \(.*\);|\1|p' \
      ${librarydir}/${library}-meta.pd)
localdep=true
MAKEFLAGS="$MAKEFLAGS LDFLAGS+=-L/home/roman/.local/lib CPPFLAGS+=-I/home/roman/.local/include"

. _common_build
