#!/bin/bash
#
# import -- source libraries in C like way
#
# copyright (c) 2018 Cj-bc
# 
# usage: import <library>

function import {

  local lib_path="/usr/local/lib"
#  local lib_path=`blib config path`
  local lib_name=($@)

  local ERROR_NOTINSTALLED=("2" "library is not installed")
  local ERROR_NOLIBGIVEN=("3" "no library is given")

  # if no arg are given, exit
  [ -z ${lib_name} ] && echo ${ERROR_NOLIBGIVEN[1]} && return ${ERROR_NOLIBGIVEN[0]}

  # 1. check whether each library is installed
  # 2. if installed, source it
  for lib in ${lib_name[@]}
  do
    [ -f "$lib_path/lib${lib}/${lib}.sh" ] || echo ${ERROR_NOTINSTALLED[1]} && return ${ERROR_NOTINSTALLED[0]}
    source ${lib_path}/lib${lib}/${lib}.sh
  done
}

import $@
