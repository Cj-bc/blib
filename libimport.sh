# libimport -- source libraries in C like way
#
# ver: 0.0.1
# tags: standard command
# desc: source given libraries
# copyright (c) 2018 Cj-bc
#


# source given libraries
# @param <string lib1> <string lib2> <string lib3> ...
# @return 0 success
# @return 1 fail in the function
# @return 2 library is not installed
# @return 3 no library is given.
function import {

  source ${BLIB_ROOT}/libstandard.sh

  local lib_path=$(BLIB_ROOT)
  local lib_name=($@)
  local -r ERROR_NOTINSTALLED=("2" "library is not installed")
  local -r ERROR_NOLIBGIVEN=("3" "no library is given")

  # if no arg are given, exit
  [ -z "${lib_name}" ] && error ${ERROR_NOLIBGIVEN[1]} && return ${ERROR_NOLIBGIVEN[0]}

  # 1. check whether each library is installed
  # 2. if installed, source it
  for lib in ${lib_name[@]}; do
    [ $(blib info ${lib})] || error ${ERROR_NOTINSTALLED[1]} && return ${ERROR_NOTINSTALLED[0]}
    source ${lib_path}/lib${lib}.sh
  done

  # record library names
  [ -z "${BLIB_LIBRARY[@]}"] && BLIB_LIBRARY=(${lib_name[@]}) || BLIB_LIBRARY=(${BLIB_LIBRARY[@]} ${lib_name[@]})

  # execute all <lib>.init
  init ${lib_name[@]}
}
