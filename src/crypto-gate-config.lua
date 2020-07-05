-- crypto-gate-config.lua

local _M = {}

function _M.load(filepath)
	local configEnv = {}

	local f,err = loadfile(filepath, "t", configEnv)

	if f then
	   f()
	   _M.path_config = configEnv.path_config
	else
	   error(err)
	end
end

return _M