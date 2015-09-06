#!/bin/bash
. _common_vars

library=slipdec
librarydir=${pdsrcdir}/externals/mrpeach/${library}
version=0.1~$(cd $librarydir; svn log | head -n2 | tail -n1 | cut -d" " -f1)

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
