#!/usr/bin/env bash
#
# Copyright 2018 (c) Cj-bc
# This software is released under MIT License
#
# @(#) version -


source "$(cd "${BASH_SOURCE[0]%/*}" && pwd)/../../bash-oo-framework/lib/oo-bootstrap.sh"
import util/test UI/Color util/tryCatch util/log util/exception
import ../../libblib/formula.oo.sh

describe 'Blib_Formula::validateFormula'
  it 'tests the proper behavior'
  try
    Blib_Formula::validateFormula 'src/proper_formula'
  expectPass

  it 'tests without initialized Library'
  try
    Blib_Formula::validdateFormula 'src/uninit_formula'
  expectFail

  it 'tests without url'
  try
    Blib_Formula::validdateFormula 'src/nourl_formula'
  expectFail

  it 'tests without name'
  try
    Blib_Formula::validdateFormula 'src/noname_formula'
  expectFail

  it 'tests without scripts'
  try
    Blib_Formula::validdateFormula 'src/noscripts_formula'
  expectFail
