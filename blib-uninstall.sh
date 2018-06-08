#!/usr/local/bin/bash

import standard

function blib.uninstall.usage {
  echo "$(json.getval $doc_usage "blib.uninstall.usage" )"
  return $EX_OK
}
# uninstall given libraries.
# @param <string library> <string library> <string library> ...
# @return $EX_OK(0) library uninstalled
# @return $EX_OSFILE(72)
function blib.uninstall {
  local targets=($@)
  for lib in ${targets[@]}; do
    blib.list.is_installed? "$lib" || error $EX_OSFILE
    rm ${BLIB_ROOT}/lib${lib}.sh
    blib.uninstall.uninstall_doc "$lib"
  done
  return $EX_OK
}
