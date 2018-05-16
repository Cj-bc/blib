# Blib install  -- install library.

usage: blib install <user/lib_name>

status code:
 -1 -- unknown error
  0 -- success
  1 -- library aleady installed
  2 -- library not found
  3 -- no internet connection

outputs:
  <lib_name> is installed under $(blib libpath)/<lib_name>.sh
