# import
  let user import libraries easier.

# how is this work?
  This command is installed as commands.
  When 'import' is called, it act like 'import' in C Language.

  for example,
  Here's 'hello.sh.lib' library which just echo 'hello!'. it's on git(cj-bc/hello.sh.lib).  
  When you don't use blib:
```
  $ git clone https://github.com/Cj-bc/hello.sh.lib.git
  $ vim #(or, emacs,etc)
  source ./hello.sh.lib/hello.sh.lib
```
  When you use blib:
```
  $ blib install Cj-bc/hello
  $ vim #(or, emacs,etc)
  import hello
```

  isn't it nicer using blib!?
