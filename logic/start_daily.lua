start_daily = function ()
	local https = require('socket.http')
	local body, code, headers = https.request("http://127.0.0.1:3030/seed")
	-- print("B, C, H", body, code, headers)

	-- print(type(body), body)

	local _, _, seed, deck, stake = string.find(body, '"seed":"([%a%d]+)","deck":"([%a]+)","stake":([%d]+)') -- temu json parser

	print("seed, ", seed, " deck, ", deck, " stake, ", stake)

	local args = {
		config = {},
		seed = seed,
		stake = stake,
		deck = deck,
		challenge = {}
	}

	G.FUNCS.start_run(args)
end
