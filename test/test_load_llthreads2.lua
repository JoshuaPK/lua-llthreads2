local llthreads2 = require"llthreads2"

llthreads2.new([[
  local os = require "os"
  print("Done!")
  os.exit(0)
]]):start():join()
