#!/bin/bash
. _common_vars

library=readdir
librarydir=${pdsrcdir}/externals/moocow/${library}
version=0.03~$(cd $librarydir; svn log | head -n2 | tail -n1 | cut -d" " -f1)

cp ${library}.patch $librarydir

(
  cd $librarydir
  
  # clean area
  rm -rf ${workspacedir}/${library}
  make clean
  svn revert -R .
  rm -rf readdir-meta.pd Makefile
  
  # apply patch
  patch -p0 < readdir.patch
)

. _common_build
