start_daily = function ()
	local https = require('socket.http')
	local body, code, headers = https.request("http://127.0.0.1:3030/seed")
	if not body then
		return
	end

	local _, _, seed, deck, stake = string.find(body, '{"seed":"([%a%d]+)","deck":"([%a]+)","stake":([%d]+)}') -- temu json parser

	G.FUNCS.start_run(nil, {seed = seed, stake = tonumber(stake), challenge = {deck = {type = deck .. " Deck"}}})
end
