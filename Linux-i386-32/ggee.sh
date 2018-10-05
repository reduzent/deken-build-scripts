#!/bin/bash
. _common_vars

library=ggee
librarydir=${pdsrcdir}/pd-${library}
version=$(sed -n \
      's|^\#X text [0-9][0-9]* [0-9][0-9]* VERSION \(.*\);|\1|p' \
      ${librarydir}/${library}-meta.pd\
      )~git$(cd $librarydir; \
      ${datecommand}$(git log -1 --pretty=format:%ct) +%Y%m%d)


. _common_build
