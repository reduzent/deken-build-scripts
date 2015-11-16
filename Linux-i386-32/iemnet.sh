#!/bin/bash
. _common_vars

library=iemnet
librarydir=${pdsrcdir}/pd-${library}
version=0.2.1~git$(cd $librarydir; date -d @$(git log -1 --pretty=format:%ct) +%Y%m%d)
MAKEFLAGS="PD_INCLUDE=../pd/src/"

. _common_build
