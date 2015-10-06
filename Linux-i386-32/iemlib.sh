#!/bin/bash
. _common_vars

library=iemlib
librarydir=${pdsrcdir}/externals/${library}
version=1.17~$(cd $librarydir; svn log | head -n2 | tail -n1 | cut -d" " -f1)
MAKEFLAGS='INSTALL_BIN=../../workspace/Linux-i386-32/iemlib INSTALL_DOC=../../workspace/Linux-i386-32/iemlib PDSOURCE=/home/roman/pd-src/pd/src'

. _common_build
