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
  local status
  eval 'BLIB_ROOT="${tmpdir}" $BLIB install Cj-bc/libtar' || status="$?"

  [[ "$?" -eq 0 ]]
  [[ -d "${tmpdir}/libtar" ]]
}

@test "blib install (invalid repo name)" {
  local result
  local status
  result="$(eval 'BLIB_ROOT=${tmpdir} $BLIB install nonexistnonexistnonexist 2>&1 >/dev/null')" || status="$?"

  [[ "$status" -eq 65 ]] # EX_DATAERR
  [[ "$result" = 'libname should form <user>/<repo>' ]]
  [[ ! -d "${tmpdir}/libtar" ]]
}

teardown() {
  rm -rf "$tmpdir"
}

