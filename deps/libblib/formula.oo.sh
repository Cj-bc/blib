#!/usr/bin/env bash
#
# Copyright 2018 (c) Cj-bc
# This software is released under MIT License
#

class:Blib::Formula() {

  # validate formula format
  # @param <string path_to_formula>
  Blib::Formula::validateFormula() {
    [string] formula

    [[ -f "$formula" ]] || @return:val 65
    source $formula

    Library >/dev/null 2>&1 || @return:val 65
    [[ ! -z "$(Library url)" ]] || @return:val 65
    [[ ! -z "$(Library name)" ]] || @return:val 65
    [[ ! -z "$(Library scripts get 0)" ]] || @return:val 65
    @return:val 0
  }


}

Type::InitializeStatic Blib::Formula
