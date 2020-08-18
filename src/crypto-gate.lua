-- crypto-gate.lua

local _M = {}

_M.strategy = require "crypto-gate-core"
_M.nginx = require "crypto-gate-nginx"

local condig = nil

local function check_url(url, pattern)

  local norm_pattern, _ = string.gsub(pattern, "-", "%%-")
  norm_pattern, _ = string.gsub(norm_pattern, "%%%%%-", "%%-")
  return string.match(url, norm_pattern)

end

local function get_request_crypto_config(url, http_method)

	for _, c in ipairs(config.path_config) do

		if(check_url(url, c.url) and http_method == c.method) then
			if(c.request_crypto == nil or c.request_crypto == "none") then
				return nil;
			else
				return c.request_crypto
			end
		end
	end

	return nil;

end

local function get_response_crypto_config(url, http_method)

	for _, c in ipairs(config.path_config) do

		if(check_url(url, c.url) and http_method == c.method) then
			if(c.response_crypto == nil or c.response_crypto == "none") then
				return nil;
			else
				return c.response_crypto
			end
		end
	end

	return nil;

end

function _M.initialize(init_config)

  config = init_config

end

function _M.process_request()

  	local user_header = ngx.var.http_X_Claim_User_Id
  	local http_method = ngx.var.request_method
  	local url = ngx.var.request_uri
  
  	_M.process_request_core(url, http_method, user_header)

end

function _M.process_response()

  	local user_header = ngx.var.http_X_Claim_User_Id
  	local http_method = ngx.var.request_method
  	local url = ngx.var.request_uri
  
  	_M.process_response_core(url, http_method, user_header)

end

function _M.process_request_core(url, http_method, user_id)

	local config = get_request_crypto_config(url, http_method)

	if(config == nil) then
		return
	end

	

end

function _M.process_response_core(url, http_method, user_id)

	local config = get_response_crypto_config(url, http_method)

	if(config == nil) then
		return
	end

end

return _M;