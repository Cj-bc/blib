#!/usr/bin/env bats
#
#
# Copyright 2018 (c) Cj-bc
# This software is released under MIT License
#

setup() {
  if [ -f './blib.oo.sh' ]; then
    BLIB='./blib.oo.sh'
  elif [ -f './blib' ]; then
    BLIB='./blib'
  fi
}

@test "check option: --prefix" {
  eval 'run $BLIB --prefix'

  echo "${lines[0]}" >&3
  echo "${BLIB_ROOT:-/usr/local/etc/blib/lib}" >&3
  [[ "$status" -eq 0 ]]
  [[ "${lines[0]}" = "${BLIB_ROOT:-/usr/local/etc/blib/lib}" ]]
}


teardown() {
:
}

