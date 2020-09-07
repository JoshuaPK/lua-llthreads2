-- Test if you build module with
-- LLTHREAD_REGISTER_THREAD_LIBRARY

local llthreads2 = require "llthreads2"
local thread = llthreads2.new([[
    if not package.preload.llthreads2 then
      print("llthreads2 does not register in thread")
      os.exit(-1)
    end
    local ok, err = pcall(require, "llthreads2")
    if not ok then
      print("can not load llthreads2: ", err)
      os.exit(-2)
    end
]]):start():join()
