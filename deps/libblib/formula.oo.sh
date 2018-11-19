#!/usr/bin/env bash
#
# Copyright 2018 (c) Cj-bc
# This software is released under MIT License
#
import util/class util/tryCatch

class:Blib_Formula() {

  # validate formula format
  # @param <string path_to_formula>
  Blib_Formula::validateFormula() (
    [string] formula

    [[ -f "$formula" ]] || e="File not exist" throw
    source $formula

    try {
      try Library >/dev/null; catch e="Library" throw
      Library url >/dev/null || e="url" throw
      Library name >/dev/null || e="name" throw
      Library scripts >/dev/null || e="script" throw
    } catch {
      e="not found [${__EXCEPTION__[1]}]" throw
      return 65
    }
    return 0
  )
}

Type::InitializeStatic Blib_Formula
