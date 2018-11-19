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

describe 'Blib_Formula::validateFormula'
  it 'tests the proper behavior'
  try
    Blib_Formula::validateFormula "${test_path}/src/proper_formula"
  expectPass

  it 'tests without initialized Library'
  try
  expectFail
    Blib_Formula::validateFormula "${test_path}/src/uninit_formula"

  it 'tests without url'
  try
  expectFail
    Blib_Formula::validateFormula "${test_path}/src/nourl_formula"

  it 'tests without name'
  try
  expectFail
    Blib_Formula::validateFormula "${test_path}/src/noname_formula"

  it 'tests without scripts'
  try
  expectFail
    Blib_Formula::validateFormula "${test_path}/src/noscripts_formula"
