#!/usr/bin/env bash
#
# Copyright 2018 (c) Cj-bc
# This software is released under MIT License
#

class:user() {

  # check if user is exist on github
  # @param <string name>
  # @stdout <string User-found>
  # @exception "User not found"
  user::is_exist() {
    [string] name
    if [[ "$(curl \"https://github.com/${name}\" -o /dev/null -w '%{http_code}' -s)" = "404" ]]; then
      e="User not found" throw
      return 1
    else
      echo "User found [${name}]."
    fi
    return 0
  }
}
