#!/bin/bash
. _common_vars

library=sfont~
librarydir=${pdsrcdir}/sfont
version=$(sed -n \
      's|^\#X text [0-9][0-9]* [0-9][0-9]* VERSION \(.*\);|\1|p' \
      ${librarydir}/${library}-meta.pd)
localdep=true
MAKEFLAGS="$MAKEFLAGS LD_LIBRARY_PATH=/home/roman/.local/lib LDFLAGS+=-L/home/roman/.local/lib CPPFLAGS+=-I/home/roman/.local/include"

. _common_build
