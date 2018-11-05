# blib getlib -- install all libraries taht used in given script

  usage: blib getlib <\script>

  status code:
   -1 -- unknown error
    0 -- success
    1 -- library not found

  output:
    status: 0 ======
      all libraries successfully installed
    status: 1 =====
      library $lib is not found. Please ask the author.
