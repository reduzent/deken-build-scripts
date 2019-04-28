#!/bin/bash
. _common_vars

library=iemlib
librarydir=${pdsrcdir}/${library}
version=1.22~git$(cd $librarydir; ${datecommand}$(git log -1 --pretty=format:%ct) +%Y%m%d)
MAKEFLAGS="INSTALL_BIN=../../workspace/${platform}/iemlib INSTALL_DOC=../../workspace/${platform}/iemlib PDSOURCE=/home/roman/pd-src/pd/src"

. _common_build
