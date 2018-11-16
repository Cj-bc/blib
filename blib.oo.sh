#!/usr/bin/env bash
#
# blib -- bash library manager
#
# Copyright 2018 (c) Cj-bc
# This software is released under MIT License
#
# @(#) version 0.2.3

source "$( cd "${BASH_SOURCE[0]%/*}" && pwd )/deps/bash-oo-framework/lib/oo-bootstrap.sh"
import util/class util/log util/trycatch util/exception UI/Console UI/Color
import ../../libblib/user.oo.sh

Logger::VOID() { :;}
Log::RegisterLogger VOID Logger::VOID

namespace blib
Log::AddOutput blib/debug DEBUG
Log::AddOutput blib/error ERROR



class:blib() {

  # treat options.
  # @param <string option>
  blib::options() {
    [string] option

    case $option in
      "--prefix" ) echo "${BLIB_ROOT:-/usr/local/etc/blib/lib}";;
    esac
  }

  # install given library.
  # @param <string libname>
  blib::install() {
    [string] libname

    # Check the library is safe to install
    try {
      [[ ! "$libname" =~ .*/.* ]] && e="libname should form <user>/<repo>" throw
      # 1. Does the same library already installed?
      # 2. Does user exist?
      # 3. Does repository exist?
      if [[ "$(blib::list)" =~ .*\s*${libname#*/}\s*.* ]]; then
        e="The library is already installed" throw
      fi
      echo "Checking the user [${libname%/*}]..."
      user::is_exist "${libname%/*}"
      echo "Checking the repo [${libname}]..."
      user::has_repo "${libname%/*}" "blib-${libname#*/}"
    } catch {
      e="${__EXCEPTION__[1]}" throw
      return
    }

    # get formula first
    echo "Getting formula [${libname}]..."
    local status; local git_clone_res # Logging
    git_clone_res="$(git clone --depth 1 -- "https://github.com/${libname/\//\/blib-}.git" "$(blib::options --prefix)/../formula/${libname#*/}" 2>&1)"\
    || status=$?; subject="debug" Log "$git_clone_res" # Logging
    unset git_clone_res # Logging

    if [ "${status-0}" -ne 0 ]; then
      unset status
      e="Fail to clone formula." throw
      return
    fi
    unset status

    # install library itself
    try {
      cd "$(blib::options --prefix)/../formula/${libname#*/}"
      source "${libname#*/}.formula"
      url="$(Library url)"
      [ "$(Library version)" = "" ]&& local version="HEAD" || local version="$(Library version)"
      echo "Getting library [${url}]..."
      git clone --depth 1 -b ${version} -- "${url}" "$(blib::options --prefix)/../Cellar/${libname#*/}/${version}" >/dev/null 2>&1 \
        || e="couldn't clone repository: ${url}" throw
      [ -d "$(blib::options --prefix)/${libname#*/}" ] || mkdir "$(blib::options --prefix)/${libname#*/}"
      Library scripts forEach ' \
                               echo -n "Linking ${item}..."; \
                               ln -s ${item} "$(blib::options --prefix)/${libname#*/}/" \
                                  && echo "" \
                                  || { echo "failed"; e="fail to link ${item}" throw;} \
                              '
    } catch {
      Console::WriteStdErr "${__EXCEPTION__[1]}"
      Console::WriteStdErr "please ask maintainer of this formula."
      e="fail to install" throw
      return
    }
    echo "Done."

    return 0
  }

  # uninstall given library.
  # @param <string libname>
  blib::uninstall() {
    [string] libname

    [[ ! "$(realpath $(blib::options --prefix)/${libname})" =~ $(blib::options --prefix)/* ]] && e="invalid library name." throw
    [[ "$libname" =~ .*/.* ]] && libname=${libname#*/} # remove username if it's appended
    [[ ! -d "$(blib::options --prefix)/${libname}" ]] && e="library ${libname} is not installed." throw
    echo "Removing [${libname}]..."
    rm -rf "$(blib::options --prefix)/${libname}"
    if [ "$?" -ne 0 ]; then
      e="$(UI.Color.Red)Fail to uninstall$(UI.Color.Default)" throw
    fi
    echo "Done."

    return
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
  try {
    case "$cmd" in
      list|install|uninstall|info|man|help ) eval 'blib::$cmd' $@;;
      -* ) blib::options $cmd;;
      * ) blib::options --help;;
    esac
  } catch {
    Console::WriteStdErr "$(UI.Color.Red)${__EXCEPTION__[1]}$(UI.Color.Default)"
    @return:val 65
  }
  @return:val 0
}

try {
  main $@
  e="$?" throw
} catch {
  exit ${__EXCEPTION__[1]}
}
