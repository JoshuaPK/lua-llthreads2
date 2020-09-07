local llthreads2 = require"llthreads2"
local utils     = require "utils"

local include = utils.thread_init .. [[
local llthreads2 = require"llthreads2"
]]

do
    local thread = llthreads2.new(include .. [[
      error({})
    ]])
    
    thread:start()
    local ok, err = thread:join()
    print(ok, err)
    assert(not ok)
end
do
    local thread = llthreads2.new(include .. [[
      llthreads2.set_logger(function(msg) print("XXX", msg) end)
      error({})
    ]])
    
    thread:start()
    local ok, err = thread:join()
    print(ok, err)
    assert(not ok)
end
do
    local thread = llthreads2.new(include .. [[
      llthreads2.set_logger(function(msg) end)
      error({})
    ]])
    
    thread:start()
    local ok, err = thread:join()
    print(ok, err)
    assert(not ok)
end
print("Done!")

