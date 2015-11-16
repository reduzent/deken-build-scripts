#!/bin/bash
. _common_vars

library=ggee
librarydir=${pdsrcdir}/${library}
version=$(cat ${librarydir}/VERSION)


. _common_build
