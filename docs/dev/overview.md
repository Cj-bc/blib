# blib
  a library manager for bash script.
  Not a Package Manager. ( package manager for bash is here,[bpkg/bpkg](https://github.com/bpkg/bpkg))
# feature

Commands:
  * 'import', 'include' command  -- import given library more easier.
  * `blib install <lib_name>` -- install <lib_name>
  * `blib uninstall <lib_name>` -- uninstall <lib_name>
  * `blib list` -- show all installed libraries
  * `blib info <lib>` -- show library infomation
  * `blib man <lib>` -- show details about <lib>
  * `blib libpath` -- output libraries path

Supports:
  * bash-completion for `blib`
  * vim-completion for import
  * bpkg support
  * homebrew support


# dependencies
  * git -- to clone libraries


# installation

  _Nothing supported yet_

  1. bpkg
    `$ bpkg install Cj-bc/blib`

  2. homebrew
    `$ brew insatll Cj-bc/blib/blib`

  3. from source
    ```
    $ git clone https://github.com/Cj-bc/blib.git
    $ cd blib
    $ ./install.sh
    ```

  for all, you should write down below in .bashrc or .bash_profile or something like that,
    `source $(bpkg libpath)/libimport.sh`
