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
    if [[ "$(curl "https://github.com/${name}" -o /dev/null -w '%{http_code}' -s)" = "404" ]]; then
      e="User not found" throw
      @return
    else
      echo "$(UI.Powerline.OK)"
    fi
    @return
  }

  # check if user has given repo
  # @param <string name> <string repo>
  user::has_repo() {
    [string] name
    [string] repo

    try {
      user::is_exist "$name" >/dev/null
    } catch {
      e="${__EXCEPTION__[1]}" throw
      @return
    }
    if [[ "$(curl "https://github.com/${name}/${repo}.git" -o /dev/null -w '%{http_code}' -s)" = "404" ]]; then
      e="repo not found" throw
    else
      echo "$(UI.Powerline.OK)"
    fi
    @return
  }
}

Type::InitializeStatic user
