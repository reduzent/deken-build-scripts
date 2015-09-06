#!/bin/bash
. _common_vars

library=ggee
librarydir=${pdsrcdir}/externals/${library}
version=$(cat ${librarydir}/VERSION)~$(cd $librarydir; svn log | head -n2 | tail -n1 | cut -d" " -f1)

. _common_build
