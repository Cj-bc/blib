#!/usr/bin/env bats

@test "import 'libstandard' -> success with 0" {
  run ./import.sh standard
  [ $status -eq 0 ]
  [ "${BLIB_LIBRARY[@]}" = "standard" ]
}

@test "import 'libnotexist' -> fail with 2" {
  run ./import.sh notexist
  [ $status -eq 2 ]
  [ "${BLIB_LIBRARY[@]}" = "" ]
}

@test "no arg -> fail with 3" {
  run ./import.sh
  [ $status -eq 3 ]
  [ "${BLIB_LIBRARY[@]}" = "" ]
}
