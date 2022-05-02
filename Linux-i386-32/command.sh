#!/bin/bash
. _common_vars

library=command
librarydir=${pdsrcdir}/${library}
version=$(sed -n \
      's|^\#X text [0-9][0-9]* [0-9][0-9]* VERSION \(.*\);|\1|p' \
      ${librarydir}/${library}-meta.pd\
      )

. _common_build
