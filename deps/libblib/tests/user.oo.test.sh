#!/usr/bin/env bash
#
# Copyright 2018 (c) Cj-bc
# This software is released under MIT License
#

source "$( cd "${BASH_SOURCE[0]%/*}" && pwd )/../../bash-oo-framework/lib/oo-bootstrap.sh"
import util/test UI/Color util/tryCatch util/log util/exception
import ../../libblib/user.oo.sh


describe 'user::is_exist'
  it "tests it'll be passed if exist user is given."
  try
    user::is_exist 'Cj-bc'
  expectPass

  it "tests it'll be failed if non-exist user is given."
  try
    user::is_exist 'nonexistnonexistnonexist'
  expectFail

  summary


describe 'user::has_repo'
  it "tests it'll be passed if exist repo is given."
  try
    user::has_repo 'Cj-bc' 'blib'
  expectPass

  it "tests it'll be failed if non-exist repo is given."
  try
    user::has_repo 'Cj-bc' 'IdontHaveThisErrrr'
  expectFail

  it "tests it'll be failed if non-exist user and repo is given."
  try
    user::has_repo 'nonexistnonexistnonexist' 'blib'
  expectFail

  summary
