#!/bin/bash
library=slipdec
version=0.1~$(svn log | head -n2 | tail -n1 | cut -d" " -f1)
platform=$(uname -s)
arch=$(dpkg --print-architecture)
bit=64
pdsrcdir=/home/roman/pd-src
librarydir=${pdsrcdir}/externals/mrpeach/${library}
pddir=${pdsrcdir}/pd/
workspacedir=${pdsrcdir}/workspace/${platform}-${arch}-${bit}
remoteworkspacedir=${workspacedir}
remotehost=netpd.org


(
  cd $librarydir

  # clean area
  rm -rf ${workspacedir}/${library}
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
