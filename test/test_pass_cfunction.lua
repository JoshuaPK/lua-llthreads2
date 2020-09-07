local llthreads2 = require"llthreads2"
local utils     = require"utils"

local thread = llthreads2.new(utils.thread_init .. [[
  require "llthreads2"
  local fn = ...

  if type(fn) ~= 'function' then
    print("ERROR! No function : ", fn, type(fn))
    os.exit(-2)
  end

  fn("print('Done!'); require'os'.exit(0)"):start():join()
]], llthreads2.new)

print(thread:start():join())
os.exit(-1)