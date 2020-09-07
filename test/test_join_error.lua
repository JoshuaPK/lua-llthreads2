local llthreads2 = require "llthreads2"
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

local ok, err = thread:join()
assert(ok  == true)
assert(err == nil)

local res, ok, err = pcall(thread.join, thread)
assert(res == true)
assert(ok  == nil)
assert(err ~= nil)

