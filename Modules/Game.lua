--!nolint DeprecatedGlobal
--!nolint BuiltinGlobalWrite
local meta = {}
meta.__index = function(self, key)
	return game:GetService(key)
end

-- Use the "local" keyword to create a local variable,
-- which can only be accessed within the current scope.
local Game = setmetatable({}, meta)

-- Use the "rawset" function to set the value of a global variable.
-- This is more efficient than using the "getgenv" and "setgenv" functions.
rawset(_G, "Game", Game)

return Game
