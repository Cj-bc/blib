#!/usr/bin/env bash
#
# blib -- bash library manager
#
# Copyright 2018 (c) Cj-bc
# This software is released under MIT License
#
# @(#) version 0.1.2

source "$( cd "${BASH_SOURCE[0]%/*}" && pwd )/deps/bash-oo-framework/lib/oo-bootstrap.sh"
import util/class util/log util/trycatch util/exception UI/Console UI/Color
import ../../libblib/user.oo.sh


class:blib() {

  # treat options.
  # @param <string option>
  blib::options() {
    [string] option

    case $option in
      "--prefix" ) echo "${BLIB_ROOT:-$HOME/.bilb}";;
    esac
  }

  # install given library.
  # @param <string libname>
  blib::install() {
    [string] libname

    # throw exception if the libname is wrong.
    [[ ! "$libname" =~ .*/.* ]] && e="libname should form <user>/<repo>" throw && return
    try {
      # 1. Does the same library already installed?
      # 2. Does user exist?
      # 3. Does repository exist?
      if [[ "$(blib::list)" =~ .*\s*${libname#*/}\s*.* ]]; then
        e="The library is already installed" throw
      fi
      echo -n "Checking the user [${libname%/*}]..."
      user::is_exist "${libname%/*}" && echo "$(UI.powerline.OK)"
      echo -n "Checking the repo [${libname}]..."
      user::has_repo "${libname%/*}" "${libname#*/}" && echo "$(UI.powerline.OK)"
    } catch {
      [[ "${__EXCEPTION__[1]}" != "The library is already installed" ]] && echo "" # do not add newline
      Console::WriteStdErr "$(UI.Color.Red)${__EXCEPTION__[1]}$(UI.Color.Default)"
      return
    }

    echo "Installing [${libname}]..."
    git clone --depth 1 -- "https://github.com/${libname}.git" "$(blib::options --prefix)/${libname#*/}" > /dev/null 2>&1
    if [ "$?" -ne 0 ]; then
      Console::WriteStdErr "$(UI.Color.Red)Fail to clone.$(UI.Color.Default)"
      return
    fi
    echo "Done."

    return 0
  }

  # uninstall given library.
  # @param <string libname>
  blib::uninstall() {
    [string] libname

    [[ ! "$(realpath $(blib::options --prefix)/${libname})" =~ $(blib::options --prefix)/* ]] && e="invalid library name." throw && return
    [[ "$libname" =~ .*/.* ]] && libname=${libname#*/} # remove username if it's appended
    [[ ! -d "$(blib::options --prefix)/${libname}" ]] && e="library ${libname} is not installed." throw && return
    echo "Removing [${libname}]..."
    rm -rf "$(blib::options --prefix)/${libname}"
    if [ "$?" -ne 0 ]; then
      Console::WriteStdErr "$(UI.Color.Red)Fail to uninstall$(UI.Color.Default)"
    fi
    echo "Done."

    return 0
  }

  # list all installed libraries.
  blib::list() {
    local prefix="$(blib::options --prefix)"
    if [[ "$(ls ${prefix})" = "" ]]; then
      echo "No library is installed."
    else
      command ls "$prefix"
    fi

    return 0
  }

  # output infomation about given library.
  # @param <string libname>
  blib::info() {
    :
  }

  # execute man for given library.
  # @param <string libname>
  blib::man() {
    :
  }

}

Type::InitializeStatic blib

function main() {
  [[ ! -d "$(blib::options --prefix)" ]] && { echo "Initialize blib directory"; mkdir "$(blib::options --prefix)"; echo "done."; }
  local cmd="$1"
  shift || true
  case "$cmd" in
    list|install|uninstall|info|man|help ) eval 'blib::$cmd' $@;;
    -* ) blib::options $cmd;;
    * ) blib::options --help;;
  esac
}

main $@
