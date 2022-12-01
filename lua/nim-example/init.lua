local uv = vim.loop
local fn = vim.fn

local ffi = require("ffi")

local this_file_path = uv.fs_realpath(debug.getinfo(1, "S").source:sub(2))
local root_path = fn.fnamemodify(this_file_path, ":h:h:h")
local lib_path
if ffi.os == "Windows" then
  lib_path = fn.expand(root_path .. "/build/libex.dll")
else
  lib_path = fn.expand(root_path .. "/build/libex.so")
end

local libex = ffi.load(lib_path)

ffi.cdef([[
int ackermann(int m, int n);
]])

local M = {}

---@param m integer
---@param n integer
---@return integer
function M.nim_ackermann(m, n)
  return libex.ackermann(m, n)
end

local function ackermann(m, n)
  if m == 0 then
    return n + 1
  elseif n == 0 then
    return ackermann(m-1, 1)
  else
    return ackermann(m-1, ackermann(m, n-1))
  end
end

---@param m integer
---@param n integer
---@return integer
function M.lua_ackermann(m, n)
  return ackermann(m, n)
end

return M
