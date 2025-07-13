G.FUNCS.upload_score = function ()
	G.GAME.daily_name = "xela"

	local https = require "SMODS.https"
	local steam = require "luasteam"

	local id = "\"" .. steam.user.getSteamID() .. "\"";
	local name = "\"" .. G.GAME.daily_name .. "\""
	local ante = G.GANE.round_scores['furthest_ante']
	local round = G.GAME.round_scores['furthest_round']
	local best_hand = G.GAME.round_scores['hand']
	local times_rerolled = G.GAME.round_scores['times_rerolled']
	local endless = not (ante >= 8)

	print(https.request("http://127.0.0.1:3030/upload", {
		headers = {
			["content-type"] = "application/json",
		},
		method = "POST",
		data = "{ \"id\": " .. id ..
		", \"name\": " .. name ..
		", \"ante\": " .. ante ..
		", \"round\": " .. round ..
		", \"best_hand\": " .. best_hand ..
		", \"rerolls\": " .. times_rerolled ..
		", \"endless\": " .. tostring(endless) ..
		" }"
	}))
end
