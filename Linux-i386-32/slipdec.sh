#!/bin/bash
library=slipdec
pdsrcdir=/home/roman/pd-src
librarydir=${pdsrcdir}/externals/mrpeach/${library}
version=0.1~$(cd $librarydir; svn log | head -n2 | tail -n1 | cut -d" " -f1)
pddir=${pdsrcdir}/pd/
platform=$(basename $(pwd))
workspacedir=${pdsrcdir}/workspace/${platform}
remoteworkspacedir=${workspacedir}
remotehost=roman@netpd.org

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
