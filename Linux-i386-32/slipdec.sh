#!/bin/bash
library=slipdec
platform=$(uname -s)
arch=$(dpkg --print-architecture)
bit=32
pdsrcdir=/home/roman/pd-src
librarydir=${pdsrcdir}/externals/mrpeach/${library}
version=0.1~$(cd $librarydir; svn log | head -n2 | tail -n1 | cut -d" " -f1)
pddir=${pdsrcdir}/pd/
workspacedir=${pdsrcdir}/workspace/${platform}-${arch}-${bit}
remoteworkspacedir=${workspacedir}
remotehost=netpd.org

cp ${library}.patch $librarydir

(
  cd $librarydir
  
  # clean area
  rm -rf LICENSE.txt README.txt slipdec-meta.pd Makefile
  
  # apply patch
  patch -p0 < ${library}.patch

  make clean
)

. _common_build