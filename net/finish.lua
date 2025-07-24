G.FUNCS.upload_score = function ()
	if G.GAME.can_start_daily == false then
		return
	end
	G.GAME.can_start_daily = false

	local https = require "SMODS.https"
	local steam = require "luasteam"

	local id = "\"" .. tostring(steam.user.getSteamID()) .. "\"";
	local name = "\"" .. G.DAILY.name .. "\""
	local ante = G.GAME.round_scores['furthest_ante'].amt
	local round = G.GAME.round_scores['furthest_round'].amt
	local best_hand = G.GAME.round_scores['hand'].amt
	local times_rerolled = G.GAME.round_scores['times_rerolled'].amt
	local endless = not (ante >= 8)

	local data = "{ \"id\": " .. id ..
		", \"name\": " .. name ..
		", \"ante\": " .. ante ..
		", \"round\": " .. round ..
		", \"best_hand\": " .. best_hand ..
		", \"rerolls\": " .. times_rerolled ..
		", \"endless\": " .. tostring(endless) ..
		" }"

	print(https.request("http://127.0.0.1:3030/upload", {
		headers = {
			["content-type"] = "application/json",
		},
		method = "POST",
		data = data
	}))
	print(data)
end
