# Blib install  -- install library.

usage: blib install <user/lib_name>

status code:
 -1 -- unknown error
  0 -- success
  1 -- library aleady installed
  2 -- library not found
  3 -- no internet connection

outputs:
  <lib_name> is installed under $(blib --prefix)/<lib_name>.sh


work:

this command fetch formula and execute install method.


1. search formula repository using given name.
2. clone the formula under `$(blib --prefix)/formula/`.
4. install library into `$(blib --prefix)/Cellar/<library_name>/<version>/`
5. link to `$(blib --prefix)/lib/<library_name>`
