#!/bin/bash
library=iemnet
platform=$(uname -s)
arch=$(dpkg --print-architecture)
bit=32
pdsrcdir=/home/roman/pd-src
librarydir=${pdsrcdir}/pd-${library}
version=0.2~git$(cd $librarydir; date -d @$(git log -1 --pretty=format:%ct) +%Y%m%d)
pddir=${pdsrcdir}/pd/
workspacedir=${pdsrcdir}/workspace/${platform}-${arch}-${bit}
remoteworkspacedir=${workspacedir}
remotehost=netpd.org

. _common_build
