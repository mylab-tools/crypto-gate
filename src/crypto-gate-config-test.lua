-- crypto-gate-config-test.lua

local iresty_test = require "resty.iresty_test"
local tb = iresty_test.new({unit_name="crypto-gate-config-test"})

local config = require "crypto-gate-config"

function tb:init(  )
   
	config.load("test\\test-config.lua")

end

function tb:test_should_load_path_config()
	
   if(config.path_config == nil) then
      error("Path config not loaded")
   end

end

function tb:test_should_load_path_config_items()
	
	local item = config.path_config[5]
   	
   	if(item.url ~= "/resource/5") then
      error("Wrong url")
   	end
   	if(item.method ~= "GET") then
      error("Wrong method")
   	end
   	if(item.request_crypto.provider ~= "json") then
   		error("Wrong request ctrypro data provider")
   	end
   	if(item.request_crypto.path ~= "/secret") then
   		error("Wrong request ctrypro path")
   	end
   	if(item.response_crypto.provider ~= "json") then
   		error("Wrong response ctrypro data provider")
   	end
   	if(item.response_crypto.path ~= "/secret") then
   		error("Wrong response ctrypro path")
   	end

end

-- units test
tb:run()
