local llthreads2 = require"llthreads2"
local utils     = require "utils"
local sleep     = utils.sleep

local include = utils.thread_init .. [[
local llthreads2 = require"llthreads2"
local sleep = require "utils".sleep
]]

local thread = llthreads2.new(include .. [[
  sleep(5)
]])
thread:start()
local ok, err = thread:join(0)
print("thread:join(0): ", ok, err)
assert(ok == nil)
assert(err == "timeout")

local ok, err = thread:join()
print("thread:join(): ", ok, err)
assert(ok, err)
print("Done!")

