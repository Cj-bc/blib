#!/usr/local/bin/bash

import standard

# generate documents from source-code
# @param <string file_name>
# @return 0 success
# @return 1 library not found
function blib.install.generate_doc {

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
  blib.install.generate_doc $(lib##*\/)
  install ${lib##*\/}.sh $(blib libpath)/${lib##*\/}.sh
  install ${lib##*\/}.bdoc $(blib libpath)/docs/${lib##*\/}.bdoc
  return 0
}

# run install function. This could given multiple names.
# @param <string lib_name> <string lib_name> ...
# @return 0 success
# @return 1 library not found
function blib.install.runinstall {
  for lib in $@;do
    blib.install $lib
    [ $? -ne 0 ] && error "error occured while installing ${lib}" && return 1
  done

  return 0
}
