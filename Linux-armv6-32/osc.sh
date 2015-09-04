#!/bin/bash
library=osc
pdsrcdir=/home/roman/pd-src
librarydir=${pdsrcdir}/externals/mrpeach/${library}
version=0.2~$(cd $librarydir; svn log | head -n2 | tail -n1 | cut -d" " -f1)
pddir=${pdsrcdir}/pd/
platform=$(basename $(pwd))
workspacedir=${pdsrcdir}/workspace/${platform}
remoteworkspacedir=${workspacedir}
remotehost=roman@netpd.org

. _common_build
