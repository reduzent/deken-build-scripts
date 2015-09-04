#!/bin/bash
library=slipenc
platform=$(uname -s)
arch=$(dpkg --print-architecture)
bit=64
pdsrcdir=/home/roman/pd-src
librarydir=${pdsrcdir}/externals/mrpeach/${library}
version=0.1~$(cd $librarydir; svn log | head -n2 | tail -n1 | cut -d" " -f1)
pddir=${pdsrcdir}/pd/
workspacedir=${pdsrcdir}/workspace/${platform}-${arch}-${bit}
remoteworkspacedir=${workspacedir}
remotehost=netpd.org

. _common_build
