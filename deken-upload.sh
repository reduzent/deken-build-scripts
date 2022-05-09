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

# display version of package for each arch
for arch in $(find ${workspacedir} -maxdepth 1 -mindepth 1 -type d)
do
  echo -ne "$(basename ${arch}):      \t"
  if [ -f "${workspacedir}/${arch}/${library}/VERSION.txt" ]
  then
    echo "v$(cat ${workspacedir}/${arch}/${library}/VERSION.txt)"
  else
    echo "None"
  fi
done

read -p "Proceed? Y/n " -n 1 proceed
echo
if [[ "$proceed" =~ [Nn] ]]
then 
  exit 1
fi

# create packages
for arch in $(find ${workspacedir} -maxdepth 1 -mindepth 1 -type d)
do
  if [ -d "${workspacedir}/${arch}/${library}" ]
  then
    ( cd ${workspacedir}/$arch
      version="$(cat ${library}/VERSION.txt)"
      rm "${library}/VERSION.txt"
      deken package --default-floatsize 32 --version "$version" "$library"
      echo "$version" > "${library}/VERSION.txt"
    )
  else
    echo "There is no '$library' library in '$arch' arch."
  fi
done

# finally upload all created packages
#deken upload $(find ${workspacedir} -regex ".*/${library}\[v${version}\]\(.*\)\.dek" -exec echo -n "{} " \;)
