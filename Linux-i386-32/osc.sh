#!/bin/bash
. _common_vars

library=osc
librarydir=${pdsrcdir}/externals/mrpeach/${library}
version=0.2~$(cd $librarydir; svn log | head -n2 | tail -n1 | cut -d" " -f1)

. _common_build
