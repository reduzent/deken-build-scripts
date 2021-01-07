#!/bin/bash
. _common_vars

library=fluid~
librarydir=${pdsrcdir}/pd-fluidsynth
# Extract version from meta file and append git ~version
version=~20200107
. _common_build
