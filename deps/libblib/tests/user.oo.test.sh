#!/usr/bin/env bash
#
# Copyright 2018 (c) Cj-bc
# This software is released under MIT License
#

source "$( cd "${BASH_SOURCE[0]%/*}" && pwd )/../../bash-oo-framework/lib/oo-bootstrap.sh"
import util/test UI/Color util/tryCatch
import ../../libblib/user.oo.sh

it "user::is_exist (expect pass)"
try
  user::is_exist 'Cj-bc'
expectPass

it "user::is_exist (expect fail)"
try
  user::is_exist 'Cj-bc'
expectFail

it "user::has_repo (expect pass)"
try
  user::has_repo 'Cj-bc' 'blib'
expectPass

it "user::has_repo (expect fail)"
try
  user::has_repo 'Cj-bc' 'IdontHaveThisErrrr'
expectFail
