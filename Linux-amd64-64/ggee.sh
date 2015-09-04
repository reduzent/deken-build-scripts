#!/bin/bash
library=ggee
version=$(cat VERSION)
platform=$(uname -s)
arch=$(dpkg --print-architecture)
bit=64
pdsrcdir=/home/roman/pd-src
librarydir=${pdsrcdir}/externals/${library}
pddir=${pdsrcdir}/pd/
workspacedir=${pdsrcdir}/workspace/${platform}-${arch}-${bit}
remoteworkspacedir=${workspacedir}
remotehost=netpd.org


(
  cd $librarydir
  # clean area
  make clean
  
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
