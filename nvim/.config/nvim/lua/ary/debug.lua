-- useful LUA functions for debugging
local P = function(value)
  print(vim.inspect(value))
  return value
end

local RELOAD = function(...)
  return require('plenary.reload').reload_module(...)
end

local R = function(name)
  RELOAD(name)
  return require(name)
end

-- Export to global for convenience
_G.P = P
_G.RELOAD = RELOAD
_G.R = R

return {
  P = P,
  RELOAD = RELOAD,
  R = R,
}
