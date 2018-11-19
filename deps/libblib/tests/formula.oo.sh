#!/usr/bin/env bash
#
# Copyright 2018 (c) Cj-bc
# This software is released under MIT License
#
# @(#) version -


test_path="$(cd "${BASH_SOURCE[0]%/*}" && pwd)"
source "${test_path}/../../bash-oo-framework/lib/oo-bootstrap.sh"
import util/test UI/Color util/tryCatch util/log util/exception
import ../../libblib/formula.oo.sh

# special handler
function expectException() {
  caught
  if [[ "${__EXCEPTION__[1]}" = "$1" ]];then
    Test EchoedOK
    Test errors = false
  else
    Test Fail "${__EXCEPTION__[@]}"
  fi
}

# ------------------------------------

describe 'Blib_Formula::validateFormula'
  it 'tests the proper behavior'
  try
    Blib_Formula::validateFormula "${test_path}/src/proper_formula"
  expectPass

  it 'tests without initialized Library'
  try
      Blib_Formula::validateFormula "hoge"
  catch expectException "File not exist"

  try
    Blib_Formula::validateFormula "${test_path}/src/uninit_formula"
  catch expectException "not found [Library]"

  it 'tests without url'
  try
    Blib_Formula::validateFormula "${test_path}/src/nourl_formula"
  catch expectException "not found [url]"

  it 'tests without name'
  try
    Blib_Formula::validateFormula "${test_path}/src/noname_formula"
  catch expectException "not found [name]"

  it 'tests without scripts'
  try
    Blib_Formula::validateFormula "${test_path}/src/noscripts_formula"
  catch expectException "not found [scripts]"

  summary
