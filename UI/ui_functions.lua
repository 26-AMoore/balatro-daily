G.FUNCS.daily_run_button = function(e)
	G.SETTINGS.paused = true
	G.GAME.Completed_daily = false
	local https = require "SMODS.https"
	print(https.request("http://127.0.0.1:3030/upload", {headers = "Content-Type: json",method = "POST",}))
	return {
		-- n = G.UIT.ROOT,
		-- config = {align = "cm", padding = 0.1},
		-- nodes = { {n = G.UIT.T, config = {text = "Hello, world!", colour = G.C.UI.TEXT_LIGHT, scale = 0.5}}},
	}
end
