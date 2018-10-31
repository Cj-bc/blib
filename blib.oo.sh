#!/usr/bin/env bash
#
# Copyright 2018 (c) Cj-bc
# This software is released under MIT License
#
# @(#) version -

source "$( cd "${BASH_SOURCE[0]%/*}" && pwd )/lib/oo-bootstrap.sh"

class:blib() {
  private string prefix

  # treat options.
  # @param <string option>
  blib::options() {
    [string] option

    case $option in
      "--prefix" ) echo "$()";;
    esac
  }

  # install given library.
  # @param <string libname>
  blib::install() {
    [string] libname

    # throw exception if the libname is wrong.
    [[ ! "$libname" =~ .*/.* ]] && e="libname should form <user>/<repo>" throw
    echo "Installing [${libname}]..."
    git clone "https://github.com/${libname}.git" "$(blib::options --prefix)/${libname#*/}" >/dev/null 2>&1
    if [ "$?" -ne 0 ]; then
      e="Fail to clone." throw
    fi
    echo "Done."

    return 0
  }

  # uninstall given library.
  # @param <string libname>
  blib::uninstall() {

  }

  # list all installed libraries.
  blib::list() {

  }

  # output infomation about given library.
  # @param <string libname>
  blib::info() {

  }

  # execute man for given library.
  # @param <string libname>
  blib::man() {

  }
}

Type::InitializeStatic blib

