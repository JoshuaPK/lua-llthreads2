local llthreads2 = require"llthreads2"

local a,b,c,d = llthreads2.version()

local str = ("%d.%d.%d"):format(a,b,c)
if d then str = str .. "-" .. d end

assert(str == llthreads2._VERSION,
  tostring(str) .. " is not eaqual to " .. tostring(llthreads2._VERSION)
)

print("Done!")

