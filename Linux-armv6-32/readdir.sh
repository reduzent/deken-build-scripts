#!/bin/bash
library=readdir
pdsrcdir=/home/roman/pd-src
librarydir=${pdsrcdir}/externals/moocow/${library}
version=0.03~$(cd $librarydir; svn log | head -n2 | tail -n1 | cut -d" " -f1)
pddir=${pdsrcdir}/pd/
platform=$(basename $(pwd))
workspacedir=${pdsrcdir}/workspace/${platform}
remoteworkspacedir=${workspacedir}
remotehost=netpd.org

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
