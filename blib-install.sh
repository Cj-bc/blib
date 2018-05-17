#!/usr/local/bin/bash

import standard

function blib.generate_doc {

  local lib_name=$1
  vim -e -s $lib_name <<-EOT
    g/^[^#f]/d
    %s/function/!@#\$%\^/g
    g/\(^f\|^$\)/d
    %s/!@#\$%\^/function/g
EOT

}
# install given library.
# @param blib.install <string lib_name>
# @return 0 success
# @return 1 library not found
# @return 2
function blib.install {

  local lib=$1
  [ -z "$lib" ] && blib.install.usage && return 2

  # 1. clone library
  # 2. checkout latest release
  # 3. make documents from code
  # 4. install library and documents
  local workspace=$(mktemp /tmp/blib.install.XXXXXXXX.tmp);cd $workspace
  git clone https://github.com/${lib}.git
  git checkout $(git describe --tags --addrev=0)
  cd $(lib##*\/)
  blib.generate_doc $(lib##*\/)
  install ${lib##*\/}.sh $(blib libpath)/${lib##*\/}.sh
  install ${lib##*\/}.bdoc $(blib libpath)/docs/${lib##*\/}.bdoc
  return 0
}

function blib.runinstall {
  for lib in $@;do
    blib.install $lib
  done
}
