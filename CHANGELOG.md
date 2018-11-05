# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## WIP
### Add
  - `blib info` -- show infomation(version, etc) for library
  - `blib man` -- show detailed description for library
  - `blib help`/`blib -h` -- help message
  - `blib update [<lib>]` -- update given library(or all libraries)
  - bundle default libraries
  - with above one, provide customized oo-bootstrap.sh so that we can use `import blib:<library>`
  - bpkg support
  - version management
  - config file for each library

### Change
  - prefix might be changed in the future(before v1)

## [v0.1.1] - 2018/11/05
### Fixed
  - don't echo stdout of 'type' command

## [v0.1.0] - 2018/11/05
### Added
  - `blib --prefix` -- return blib prefix(all libraries are installed under there)
  - `blib list` -- list installed libraries
  - `blib install <user>/<repo>` -- install given library
  - `blib uninstall <libary_name>` -- uninstall library
  - Makefile: `test` target is available
  - Homebrew support -- I hope this works
