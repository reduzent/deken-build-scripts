#!/bin/bash
library=iemnet
version=0.2~git$(date -d @$(git log -1 --pretty=format:%ct) +%Y%m%d)
platform=$(uname -s)
arch=$(dpkg --print-architecture)
bit=64
pdsrcdir=/home/roman/pd-src
librarydir=${pdsrcdir}/pd-${library}
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

