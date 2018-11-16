#!/usr/bin/env bats
# shellcheck disable=SC2034,SC1089
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


# shellcheck disable=SC1083
@test "check option: --prefix" {
  eval 'run $BLIB --prefix'

  # shellcheck disable=SC2154
  [[ "$status" -eq 0 ]]
  # shellcheck disable=SC2154
  [[ "${lines[0]}" = "${BLIB_ROOT:-/usr/local/etc/blib/lib}" ]]
}


@test "blib install" {
  eval 'BLIB_ROOT="${tmpdir}" $BLIB install Cj-bc/libtar'

  [[ "$?" -eq 0 ]]
  [[ -d "${tmpdir}/libtar" ]]
}

@test "blib install (invalid repo name)" {
  local result
  local status
  result="$(eval 'BLIB_ROOT=${tmpdir} $BLIB install nonexistnonexistnonexist 2>&1')" || status="$?"

  echo "$result" # DEBUG
  [[ "$status" -eq 65 ]] # EX_DATAERR
  [[ "$result" = 'libname should form <user>/<repo>' ]]
  [[ ! -d "${tmpdir}/libtar" ]]
}

@test "blib install (User not found)" {
  local result
  local status
  result="$(eval 'BLIB_ROOT=${tmpdir} $BLIB install nonexistnonexistnonexist/hoge 2>&1 >/dev/null')" || status="$?"

  [[ "$status" -eq 65 ]] # EX_DATAERR
  [[ "$result" = 'User not found' ]]
  [[ ! -d "${tmpdir}/libtar" ]]
}


@test "blib install (repo not found)" {
  local result
  local status
  result="$(eval 'BLIB_ROOT=${tmpdir} $BLIB install Cj-bc/IdontHaveIt 2>&1 >/dev/null')" || status="$?"

  [[ "$status" -eq 65 ]] # EX_DATAERR
  [[ "$result" = 'repo not found' ]]
  [[ ! -d "${tmpdir}/libtar" ]]
}


@test "blib install(wrong formula.)" {
  skip "Under construction"

  local status
  local result
  result="$(eval 'BLIB_ROOT=${tmpdir} $BLIB install Cj-bc/libtar 2>&1')" || status="$?"

  [[ "$status" -eq 65 ]]
  [[ "$result" =~ "couldn't clone repository: ".* ]]

}


@test "blib list" {
   eval 'run $BLIB list'

   [[ "$status" -eq 0 ]]
}


@test "blib uninstall" {
  eval 'BLIB_ROOT=${tmpdir} $BLIB install Cj-bc/libtar' # install library to uninstall
  local status
  local result
  result="$(eval 'BLIB_ROOT=${tmpdir} $BLIB uninstall libtar 2>/dev/null' | tail -n 1)" || status="$?"

  [[ "$status" -eq 0 ]]
  [[ "$result" = 'Done.' ]]
  [[ ! -d "${tmpdir}/libtar" ]]
}


@test "blib uninstall(invalid library name)" {
  eval 'BLIB_ROOT=${tmpdir} $BLIB install Cj-bc/libtar' # install library to uninstall
  local status
  local result
  result="$(eval 'BLIB_ROOT=${tmpdir} $BLIB uninstall ../../libtar 2>&1')" || status="$?"

  echo "invalid lib name status: $status" # DEBUG
  [[ "$status" -eq 65 ]]
  [[ "$result" = "invalid library name." ]]
  [[ -d "${tmpdir}/libtar" ]]
}


@test "blib uninstall(library libtar is not installed.)" {
  local status
  local result
  result="$(eval 'BLIB_ROOT=${tmpdir} $BLIB uninstall libtar 2>&1')" || status="$?"

  echo "not installed lib status: $status" # DEBUG
  echo "not installed lib result: '$result'" # DEBUG
  [[ "$status" -eq 65 ]]
  [[ "$result" = "library libtar is not installed." ]]
}


teardown() {
  rm -rf "$tmpdir"
}

