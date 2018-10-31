#!/usr/bin/env bash
#
# Copyright 2018 (c) Cj-bc
# This software is released under MIT License
#
# @(#) version -

#!/usr/bin/env bash

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

