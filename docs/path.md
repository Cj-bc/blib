# All path related to blib

  ## common path
    /usr/local/lib/blib/  -- where all installed libraries are stored
                       /<library_name>  -- all files related <library_name> is under directory.
                                      /lib<library_name>.sh -- library itself

  ## when you use Homebrew

    /usr/local/bin/blib   --  symboliclink of /usr/lcoal/Cellar/blib/<version>/blib
    /usr/local/bin/import
                  /include
                  /using    -- symboliclink of /usr/local/Cellar/blib/<version>/import

  ## when you use bpkg

  /usr/local/bin/blib -- blib itself
  /usr/local/bin/import -- import itself
                /include  -- symboliclink of import
                /using    -- symboliclink of import
