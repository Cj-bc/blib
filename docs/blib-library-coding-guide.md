Any argunments/comments/issues/PRs are really WELCOME.
Please create issue/or join exist issue to discuss the style!!
----

To make good library, and to avoid conflict with other  library,
here's some rule to make library.

# before coding
  As this is library, option(-something) is not good.
  Please design simple


# initialize your code
  * you don't need write shebung (isn't it good?)
  * At the top, write summary of your library

  Example:
  ```
    # libtkinsh.sh  -- Tkinter in Shellscript
    #
    # ver: 0.0.1
    # tags: graphic UI
    # desc: Make UI easier. Provide a lot of UI parts and user interface.
    # dependencies: 
    #
    # copyright (c) 2018 Cj-bc
    # This software is released under MIT License.
    #
  ```

  make sure the last line contains only '#'.
  This is because of blib.generate_doc.

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
    But, only initialize code for library itself is allowed.

# comments
  From comment, `blib` will automatically generate text for `blib info`
and `blib man`
  So, please write in this style.

  1. write description before functions.
    Please write description so that user can search easier.

    For example: my 'box' function from Cj-bc/vstult-3,

    ```
      # Draw box. can contains texts
      # @stdin string text
      # @stdout string text same as stdin
      # @param <int start_y> <int width> <int height> <string left|center|right>
      # @return 0 success
    ```

  2. write description before environmental variable.
    Please write description for environmental variables.

    For example:
    ```
      # @env library path
      export BLIB_PATH="/usr/local/lib/blib"
    ```


# about repository
  Please manage your library on Github.
  I'll try to support other way, but now, nothing is supported but Github.
