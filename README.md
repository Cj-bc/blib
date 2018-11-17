日本語: [JA_README.md]

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
    # if you want to re-install without uninstall, set `FORCE_INSTALL` to 'true'.
    # by default, `make install` will fail if `blib` command is available.
    $ make FORCE_INSTALL=true install
    # Of cource, you can combine both
    $ make root=<your/path> FORCE_INSTALL=true install
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


# Make library available for blib

If you want to make your library available for blib, please make formula repository.
(I took this way so that we can make formula of other's libraries)
It should be hosted on Github (for now).

## make formula

The formula should be named as '<library_name>.blib.formula'
Repository  should be named as 'blib-<library_name>' (like homebrew)

### form of formula

Example:
```
class:Library() {
  @required public string name = "libhttp"
  @required public string url = "https://github.com/Cj-bc/libhttp.git"
  @required public array  scripts push "libhttp.sh"
            public array  tests push "tests"
            public string version = "v1.2.3"
            public string description = "use HTTP method easier"
            public array  dependencies push "libhttp"

  Library.test() {
    make test
  }
}

Type::InitializeStatic Library
```

tests are not requirement so that we can write formula for 
#### properties

|properties    | description                                                  | is needed? |
|:-:           |:-:                                                           |:-:         |
| name         | the name of repository                                       | O          |
| url          | the url where this library is published                      | O          |
| scripts      | library scripts                                              | O          |
| tests        | test scripts. I recommend to use bats or oo-framework's test | X          |
| dependencies | dependencies for the library. array.                         | X          |
| description  | description for the library                                  | X          |
| version      | the version to install.If it's empty, HEAD will be used      | X          |

#### methods

|methods          | description                         | is needed? |
|:-:              |:-:                                  |:-:         |
| Library.test    | will be executed to test library    | X          |

