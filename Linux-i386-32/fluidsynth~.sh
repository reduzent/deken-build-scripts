#!/bin/bash
. _common_vars

library=fluidsynth~
librarydir=${pdsrcdir}/pd-fluidsynth
# Extract version from meta file and append git ~version
version=~20200110
. _common_build
