local llthreads2 = require"llthreads2.ex"

local thread = llthreads2.new(function() return 1 end)

assert(not thread:started())

-- thread is not started so this is not valid values
assert(not thread:detached())
assert(not thread:joinable())

assert(thread:start(true, true))

assert(thread:detached())
assert(thread:joinable())

assert(thread:join())

assert(thread:started())
assert(not thread:alive())

print("done!")