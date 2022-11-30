local fib = require("nim-example")

vim.api.nvim_create_user_command("Fib", function(opt)
  local num = tonumber(opt.args)
  print(fib(num))
end, { nargs = 1 })
