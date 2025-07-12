G.FUNCS.daily_run_button = function(e)
	G.SETTINGS.paused = true
	G.GAME.Completed_daily = false
	local https = require "SMODS.https"
	local id = 0
	local name = "\"test\""
	local ante = 0
	local round = 0
	local best_hand = 0
	local times_rerolled = 0
	local endless = false

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
		", \"times_rerolled\": " .. times_rerolled ..
		", \"endless\": " .. tostring(endless) ..
		" }"
	}))
	local crash = G.DNE;
	-- return {
	-- 	-- n = G.UIT.ROOT,
	-- 	-- config = {align = "cm", padding = 0.1},
	-- 	-- nodes = { {n = G.UIT.T, config = {text = "Hello, world!", colour = G.C.UI.TEXT_LIGHT, scale = 0.5}}},
	-- }
end
