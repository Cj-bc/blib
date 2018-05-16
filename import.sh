#!/bin/bash
#
# import -- source libraries in C like way
#
# ver: 0.0.1
# tags: standard command
# desc: source given libraries
# copyright (c) 2018 Cj-bc
#
# usage: import <library> <Library2> <Library3> ...

source $(blib libpath)/libstandard.sh

# source given libraries
# @param <string lib1> <string lib2> <string lib3> ...
# @return 0 success
# @return 1 fail in the function
# @return 2 library is not installed
# @return 3 no library is given.
function import {

  local lib_path=`blib libpath`
  local lib_name=($@)
  local -r ERROR_NOTINSTALLED=("2" "library is not installed")
  local -r ERROR_NOLIBGIVEN=("3" "no library is given")

  # if no arg are given, exit
  [ -z "${lib_name}" ] && error ${ERROR_NOLIBGIVEN[1]} && return ${ERROR_NOLIBGIVEN[0]}

  # 1. check whether each library is installed
  # 2. if installed, source it
    [ -f "$lib_path/lib${lib}/${lib}.sh" ] || echo ${ERROR_NOTINSTALLED[1]} && return ${ERROR_NOTINSTALLED[0]}
    source ${lib_path}/lib${lib}/${lib}.sh
  for lib in ${lib_name[@]}; do
  done
}

import $@
