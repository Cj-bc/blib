#!/usr/local/bin/bash

import standard


# show all installed libraries
# @param
# @return $EX_OK(0) success
function blib.list.show_all {
  [ -z "$BLIB_ROOT" ] && error $EX_OSERR "BLIB_ROOT is not defined."

  libs=$(ls $BLIB_ROOT | tr '\n' ' ' )
  echo "${libs[@]%.sh}"
  return $EX_OK
}


# check weather the library is installed.
# @param <string library-name>
# @return $EX_OK(0) library exist
# @return $EX_UNAVAILABLE(69) library not installed
function blib.list.is_installed? {
    local target=$1
    for installed in $(blib.list.show_all); do
      [ "$target" = "$installed" ] && return $EX_OK
    done

    return $EX_UNAVAILABLE
}
