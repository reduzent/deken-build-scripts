#!/bin/bash
. _common_vars

library=slip
librarydir=${pdsrcdir}/mrpeach/${library}
version=$(sed -n \
      's|^\#X text [0-9][0-9]* [0-9][0-9]* VERSION \(.*\);|\1|p' \
      ${librarydir}/${library}-meta.pd\
      )~git$(cd $librarydir; \
      ${datecommand}$(git log -1 --pretty=format:%ct) +%Y%m%d)

. _common_build

