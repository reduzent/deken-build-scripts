#!/bin/bash
. _common_vars

library="flite"
librarydir="${pdsrcdir}/${library}"
version=$(sed -n \
      's|^\#X text [0-9][0-9]* [0-9][0-9]* VERSION \(.*\);|\1|p' \
      ${librarydir}/${library}-meta.pd)
localdep=true

. _common_build
