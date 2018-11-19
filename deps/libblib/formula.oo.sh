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
      try Library url >/dev/null; catch e="url" throw
      try Library name >/dev/null; catch e="name" throw
      try Library scripts >/dev/null; catch e="scripts" throw
    } catch {
      e="not found [${__EXCEPTION__[1]}]" throw
      return 65
    }
    return 0
  )
}

Type::InitializeStatic Blib_Formula
