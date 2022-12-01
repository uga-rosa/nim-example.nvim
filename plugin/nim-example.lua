local example = require("nim-example")

vim.api.nvim_create_user_command("NimAckermann", function(opt)
  local m = tonumber(opt.fargs[1]) or 0
  local n = tonumber(opt.fargs[2]) or 0
  print(example.nim_ackermann(m, n))
end, { nargs = "+" })

vim.api.nvim_create_user_command("LuaAckermann", function(opt)
  local m = tonumber(opt.fargs[1]) or 0
  local n = tonumber(opt.fargs[2]) or 0
  print(example.lua_ackermann(m, n))
end, { nargs = "+" })
