Any argunments/comments/issues/PRs are really WELCOME.
Please create issue/or join exist issue to discuss the style!!
----

To make good library, and to avoid conflict with other  library,
here's some rule to make library.

# before coding
  Before coding, make sure your library name is start with 'lib' and has readable name.

  libmath.sh
  ---====---
   |  |   |
   |  |   +---- suffix '.sh'
   |  +--- your library name
   +-- prefix 'lib'


# initialize your code
  * you don't need write shebung (isn't it good?)
  * At hte top, write summary of your library

  Example:
  ```
    # libtkinsh.sh  -- Tkinter in Shellscript
    #
    # ver: 0.0.1
    # tag: graph UI
    # desc: Make UI easier. Provide a lot of UI parts and user interface.
    #
    # copyright (c) 2018 Cj-bc
    # This software is released under MIT License.
  ```

# coding style
  Basically, you can code in any way.
  But, there's few rules to avoid conflict.

  1. Put Library name before function name.

        one word name: "get" "func"
        simple word name: "testfunc"
      are not good when we think about conflict.
      Best practice is to put your library name.
        "get" -> "Tkinsh.get"

  2. Put Library name before environment variable.
      The same as 1.

  3. Use "local" flag for each variable.
    To avoid conflict, the scope should be limited.

  4. Do not write code outside the functions.
    There might no need to say.
    It because 'blib' will source whole library itself.
    So, if you have something should be done at first,
    make a function named '<library_name>.init'
    `blib` will automatically execute them first.

