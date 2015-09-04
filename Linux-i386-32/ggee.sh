#!/bin/bash
library=ggee
platform=$(uname -s)
arch=$(dpkg --print-architecture)
bit=32
pdsrcdir=/home/roman/pd-src
librarydir=${pdsrcdir}/externals/${library}
version=$(cat ${librarydir}/VERSION)~$(cd $librarydir; svn log | head -n2 | tail -n1 | cut -d" " -f1)
pddir=${pdsrcdir}/pd
workspacedir=${pdsrcdir}/workspace/${platform}-${arch}-${bit}
remoteworkspacedir=${workspacedir}
remotehost=netpd.org

. _common_build
