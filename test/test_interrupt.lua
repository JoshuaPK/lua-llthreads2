local llthreads2 = require"llthreads2"
local utils     = require "utils"
local sleep     = utils.sleep

local include = utils.thread_init .. [[
local llthreads2 = require"llthreads2"
local sleep = require "utils".sleep
]]

do
    local thread = llthreads2.new(include .. [[
      for i = 1, 10 do sleep(1) end
    ]])
    
    thread:start()
    sleep(1)
    thread:interrupt()
    
    local ok, err = thread:join()
    print("thread1:join(): ", ok, err)
    assert(ok == false and err:match(llthreads2.interrupted_error), "thread1 result")
    print("--- Done interrupt1!")
end


do
    local thread = llthreads2.new(include .. [[
      local ok, err = pcall(function() for i = 1, 10 do sleep(1) end end)
      print("thread2:", ok, err)
      assert(ok == false and err:match(llthreads2.interrupted_error), "interrupt2 result")
    ]])
    
    thread:start()
    sleep(1)
    thread:interrupt()
    
    local ok, err = thread:join()
    print("thread2:join(): ", ok, err)
    assert(ok, "thread2 result")
    print("--- Done interrupt2!")
end

do
    local thread = llthreads2.new(include .. [[
      local ok, err = pcall(function() for i = 1, 10 do sleep(1) end end)
      print("thread3:", ok, err)
    ]])
    
    thread:start()
    sleep(1)
    thread:interrupt(true)
    
    local ok, err = thread:join()
    print("thread3:join(): ", ok, err)
    assert(ok == false and err:match(llthreads2.interrupted_error), "thread3 result")
    print("--- Done interrupt3!")
end

