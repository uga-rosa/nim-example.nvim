local uv = vim.loop
local fn = vim.fn

local ffi = require("ffi")

local this_file_path = uv.fs_realpath(debug.getinfo(1, "S").source:sub(2))
local root_path = fn.fnamemodify(this_file_path, ":h:h:h")
local lib_path
if ffi.os == "Windows" then
  lib_path = fn.expand(root_path .. "/src/fib.dll")
else
  lib_path = fn.expand(root_path .. "/src/libfib.so")
end

local libfib = ffi.load(lib_path)

ffi.cdef([[
int fib(int n);
]])

return function(n)
  return libfib.fib(n)
end
