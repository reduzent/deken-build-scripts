#!/bin/bash
. _common_vars

library=fluidsynth~
librarydir=${pdsrcdir}/fluidsynth
version=$(sed -n \
      's|^\#X text [0-9][0-9]* [0-9][0-9]* VERSION \(.*\);|\1|p' \
      ${librarydir}/${library}-meta.pd)
localdep=true

. _common_build
