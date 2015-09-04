#!/bin/bash
library=readdir
version=0.03~$(svn log | head -n2 | tail -n1 | cut -d" " -f1)
platform=$(uname -s)
arch=$(dpkg --print-architecture)
bit=64
pdsrcdir=/home/roman/pd-src
librarydir=${pdsrcdir}/externals/moocow/${library}
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
  
  # build
  if ! ( make PD_PATH=${pddir} && \
         make pkglibdir=${workspacedir} install )
  then
    echo "error while building"
    exit 1
  fi
  
  # create version-file
  echo "$version" > ${workspacedir}/${library}/VERSION
  
  # copy
  rsync -av --delete ${workspacedir}/${library} ${remotehost}:${remoteworkspacedir}/.
)
