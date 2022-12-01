if vim.g.loaded_nim_example then
  return
end
vim.g.loaded_nim_example = true

local example = require("nim-example")

---@param msg string
---@param ... unknown
local function printf(msg, ...)
  print(msg:format(...))
end

vim.api.nvim_create_user_command("NimAckermann", function(opt)
  local m = tonumber(opt.fargs[1]) or 0
  local n = tonumber(opt.fargs[2]) or 0
  local start_time = os.clock()
  print(example.nim_ackermann(m, n))
  printf("time: %s ms", (os.clock() - start_time) * 1000)
end, { nargs = "+" })

vim.api.nvim_create_user_command("LuaAckermann", function(opt)
  local m = tonumber(opt.fargs[1]) or 0
  local n = tonumber(opt.fargs[2]) or 0
  local start_time = os.clock()
  print(example.lua_ackermann(m, n))
  printf("time: %s ms", (os.clock() - start_time) * 1000)
end, { nargs = "+" })
