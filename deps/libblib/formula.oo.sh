#!/usr/bin/env bash
#
# Copyright 2018 (c) Cj-bc
# This software is released under MIT License
#
import util/class util/tryCatch

class:Blib_Formula() {

  # validate formula format
  # @param <string path_to_formula>
  Blib_Formula::validateFormula() {
    [string] formula

    [[ -f "$formula" ]] || return 65
    source $formula

    try {
      Library >/dev/null
      Library url >/dev/null
      Library name >/dev/null
      Library scripts >/dev/null
    } catch {
      return 65
    }
    return 0
  }
}

Type::InitializeStatic Blib_Formula
