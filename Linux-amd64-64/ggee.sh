#!/bin/bash
library=ggee
platform=$(uname -s)
arch=$(dpkg --print-architecture)
bit=64
pdsrcdir=/home/roman/pd-src
librarydir=${pdsrcdir}/externals/${library}
version=$(cat ${librarydir}/VERSION)
pddir=${pdsrcdir}/pd/
workspacedir=${pdsrcdir}/workspace/${platform}-${arch}-${bit}
remoteworkspacedir=${workspacedir}
remotehost=netpd.org

. _common_build
