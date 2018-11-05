# blib
  a library manager for bash script.
  Not a Package Manager. ( package manager for bash is here,[bpkg/bpkg](https://github.com/bpkg/bpkg))

# This project uses bash-oo-framework as basement.

This project uses [niieani/bash-oo-framework](https://github.com/niieani/bash-oo-framework) as basement.
The *import* command is provided by the framework.

# feature

## Commands:
  * 'import' command  -- import given library more easier. use `import blib:<lib>`
  * `blib install <lib_name>` -- install <lib_name>
  * `blib uninstall <lib_name>` -- uninstall <lib_name>
  * `blib list` -- show all installed libraries
  * `blib info <lib>` -- show library infomation
  * `blib man <lib>` -- show details about <lib>

## Environmental vars
  * BLIB_ROOT -- the path where all libraries installed. default: `~/.blib`

## Supports:
  * bash-completion for `blib`
  * vim-completion for import
  * bpkg support
  * homebrew support


# dependencies
  * bash-oo-framework -- the basement framework. This is *implemented*.
  * git -- to clone libraries
  * realpath -- to verify library name. provided by gnucoreutil, etc.


# installation

  _Nothing supported yet_

  1. bpkg
    ```
    $ bpkg install Cj-bc/blib
    $ echo "export BLIB_ROOT=/if/you/want/some/other/path"
    ```

  2. homebrew
    ```
    $ brew insatll Cj-bc/blib/blib
    $ echo "export BLIB_ROOT=/if/you/want/some/other/path"
    ```

  3. from source
    ```
    $ git clone https://github.com/Cj-bc/blib.git
    $ cd blib
    $ ./install.sh
    ```
