#!/bin/bash
. _common_vars

library=slip
librarydir=${pdsrcdir}/externals/mrpeach/${library}
version=0.1~$(cd ${pdsrcdir}/externals/mrpeach/slipdec; svn log | head -n2 | tail -n1 | cut -d" " -f1)

# create build layout
mkdir -p $librarydir
cp ${library}.patch $librarydir

(
  cd $librarydir
  ln -s ../slipdec/* .
  ln -s ../slipenc/* . 
  
  # apply patch
  patch -p0 < ${library}.patch
)

. _common_build

# clean up
rm -rf $librarydir
