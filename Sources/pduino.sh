#!/bin/bash
. _common_vars

library=pduino
librarydir=${pdsrcdir}/${library}
# Extract version from meta file and append git ~version
version=$(sed -n \
      's|^\#X text [0-9][0-9]* [0-9][0-9]* VERSION \(.*\);|\1|p' \
      ${librarydir}/${library}-meta.pd)

. _common_build
