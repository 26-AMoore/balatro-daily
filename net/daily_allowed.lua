daily_allowed = function ()
	-- print("running daily_allowed")
	local https = require("socket.http")
	local steam = require "luasteam"
	local id = tostring(steam.user.getSteamID())
	local vers, _, _ = https.request("http://127.0.0.1:3030/version")

	-- print("version:" .. vers)
	-- print("myversion:" .. G.DAILY.version)

	if vers ~= G.DAILY.version then
		-- print("versions do not match")
		return false;
	end

	local req_path = "http://127.0.0.1:3030/id/" .. tostring(id)
	-- print(req_path)
	local body, code, headers = https.request(req_path)

	-- print("bodied")
	-- print(type(body).. body)
	-- print("bodied")

	if body == nil then
		return false;
	end

	return body == "false"
end
