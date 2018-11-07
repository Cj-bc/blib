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

  # temp dir

  tmpdir="${BATS_TMPDIR}/blib_bats_$(date +%y-%m-%d-%H-%M-%S)_lib.tmp"
  mkdir "$tmpdir"

}


@test "check option: --prefix" {
  eval 'run $BLIB --prefix'

  [[ "$status" -eq 0 ]]
  [[ "${lines[0]}" = "${BLIB_ROOT:-/usr/local/etc/blib/lib}" ]]
}


@test "blib install" {
  eval 'BLIB_ROOT="${tmpdir}" $BLIB install Cj-bc/libtar'

  [[ "$?" -eq 0 ]]
  [[ -d "${tmpdir}/libtar" ]]
}
teardown() {
  rm "$tmp"
}

