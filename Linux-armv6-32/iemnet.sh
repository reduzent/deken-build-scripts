#!/bin/bash
library=iemnet
pdsrcdir=/home/roman/pd-src
librarydir=${pdsrcdir}/pd-${library}
version=0.2~git$(cd $librarydir; date -d @$(git log -1 --pretty=format:%ct) +%Y%m%d)
pddir=${pdsrcdir}/pd/
platform=$(basename $(pwd))
workspacedir=${pdsrcdir}/workspace/${platform}
remoteworkspacedir=${workspacedir}
remotehost=netpd.org

. _common_build
