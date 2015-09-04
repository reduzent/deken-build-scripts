#!/bin/bash
library=readdir
platform=$(uname -s)
arch=$(dpkg --print-architecture)
bit=64
pdsrcdir=/home/roman/pd-src
librarydir=${pdsrcdir}/externals/moocow/${library}
version=0.03~$(cd $librarydir; svn log | head -n2 | tail -n1 | cut -d" " -f1)
pddir=${pdsrcdir}/pd/
workspacedir=${pdsrcdir}/workspace/${platform}-${arch}-${bit}
remoteworkspacedir=${workspacedir}
remotehost=netpd.org

cp readdir.patch $librarydir

(
  cd $librarydir
  
  # clean area
  rm -rf ${workspacedir}/${library}
  make clean
  svn revert -R .
  rm -rf readdir-meta.pd Makefile
  
  # apply patch
  patch -p0 < fix-readdir.patch
)

. _common_build
