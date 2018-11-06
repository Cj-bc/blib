# blib
  a library manager for bash script.
  Not a Package Manager. ( package manager for bash is here,[bpkg/bpkg](https://github.com/bpkg/bpkg))

# This project uses bash-oo-framework as basement.

This project uses [niieani/bash-oo-framework](https://github.com/niieani/bash-oo-framework) as basement.
The *import* command is provided by the framework.

# feature

## Commands:
  * `blib install <lib_name>` -- install <lib_name>
  * `blib uninstall <lib_name>` -- uninstall <lib_name>
  * `blib list` -- show all installed libraries
  * `blib info <lib>` -- show library infomation
  * `blib man <lib>` -- show details about <lib>

## Command for scripting
  * 'import' command  -- import given library more easier. use `import blib:<lib>`

## Environmental vars
  * BLIB_ROOT -- the path where all libraries installed. default: `/usr/local/etc/blib/lib`
                 (For homebrew: it will be `/usr/local/Cellar/blib/<version>/lib`)

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

  `from source` is available now.  
  I'm working on `homebrew`  

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
    $ make install
    # if you want to define ROOT directory(where blib itself will be put. libraries will be installed to `ROOT/lib`),
    $ make root=<your/path> install
    ```

# how to make scripts using blib libraries

You should add this line at the top of your script(of course after shebang):

```bash
source "$(blib --prefix)/bash-oo-framework/lib/oo-bootstrap.sh"
```

By doing this, you can use `import` command to import libraries.  
In this case, **Do not use official bash-oo-framework because it doesn't support blib**  

Or, you can source libraries directly by doing:

```bash
source "$(blib --prefix)/path/to/the/script"
```
