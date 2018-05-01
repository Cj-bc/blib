list
---------------
  1. Scope of variables


# be careful: Scope of Variables

if library has:
```bash:libtest
  function test {
    x=$1
    echo $x
  }
```
And user has:
```bash:test.sh
  x="hello world"
  test "Good Evening"
  echo $x
```
It might work like:
```
  $ ./test.sh
  Good Evening
  Good Evening
```

To avoid this, we should use "local Variables"
with 'local' keyword
