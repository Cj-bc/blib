#!/usr/bin/env bats
#
# bats test for libblib. needs '--tap' to excecute.
#
# Copyright 2018 (c) Cj-bc
# This software is released under MIT License
#
# @(#) version v0.1.0

@test "running oo test file..." {
  ./deps/libblib/tests/user.oo.test.sh >&3 2>&3
}
