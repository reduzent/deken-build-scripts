#!/bin/bash
library=$1
workspacedir="../workspace"

if [ -z $library ]
then
  echo "Please specify a library for uploading"
  exit 1
fi

# Get version of package series 
version="$(cat ${workspacedir}/Sources/${library}/VERSION.txt)"

# create packages
for arch in $(find ${workspacedir} -maxdepth 1 -mindepth 1 -type d)
do
  if [ -d "${workspacedir}/${arch}/${library}" ]
  then
    ( cd ${workspacedir}/$arch
      deken package --version "$(cat ${library}/VERSION.txt)" "$library"
    )
  else
    echo "There is no '$library' library in '$arch' arch."
  fi
done

# finally upload all created packages
deken upload $(find ${workspacedir} -regex ".*/${library}-v${version}-\(.*\)-externals\.\(tar\.gz\|zip\)" -exec echo -n "{} " \;)
