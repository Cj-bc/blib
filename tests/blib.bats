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

  echo "${lines[0]}" >&3
  echo "${BLIB_ROOT:-/usr/local/etc/blib/lib}" >&3
  [[ "$status" -eq 0 ]]
  [[ "${lines[0]}" = "${BLIB_ROOT:-/usr/local/etc/blib/lib}" ]]
}


@test "blib install" {
  eval 'run BLIB_ROOT=${tmpdir} $BLIB install Cj-bc/libtar'

  [[ "$status" -eq 0 ]]
  [[ "${lines[3]}" = "Done." ]]
  [[ -d "${tmpdir}/libtar" ]]
}
teardown() {
  rm "$tmp"
}

