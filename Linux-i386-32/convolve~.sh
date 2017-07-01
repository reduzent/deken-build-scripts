#!/bin/bash
. _common_vars

library=convolve~
librarydir=${pdsrcdir}/pd-convolve
# Extract version from meta file
version=$(sed -n \
      's|^\#X text [0-9][0-9]* [0-9][0-9]* VERSION \(.*\);|\1|p' \
      ${librarydir}/${library}-meta.pd)

. _common_build
