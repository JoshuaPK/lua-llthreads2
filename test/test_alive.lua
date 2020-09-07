local llthreads2 = require"llthreads2"
local utils     = require "utils"
local sleep     = utils.sleep

local include = utils.thread_init .. [[
local llthreads2 = require"llthreads2"
local sleep = require "utils".sleep
]]

local thread = llthreads2.new(include .. [[
  sleep(5)
  return 1,2,3
]])

assert(nil == thread:alive())

thread:start()

assert(true == thread:alive())

for i = 1, 10 do
  if not thread:alive() then break end
  sleep(1)
end

assert(false == thread:alive())

local ok,a,b,c = thread:join(0)
assert(ok == true)
assert(a == 1)
assert(b == 2)
assert(c == 3)

print("Done!")

