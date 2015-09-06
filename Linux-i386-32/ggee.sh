#!/bin/bash
. _common_vars

library=ggee
librarydir=${pdsrcdir}/externals/${library}
version=$(cat ${librarydir}/VERSION)~$(cd $librarydir; svn log | head -n2 | tail -n1 | cut -d" " -f1)

cp ${library}.patch $librarydir

(
  cd $librarydir
  
  # revert changes
  svn revert -R .
  
  # apply patch
  patch -p0 < ${library}.patch
)

. _common_build
