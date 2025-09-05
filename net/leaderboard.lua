function get_leaderboard_scores(i)
	local https = require("socket.http")
	local data, _, _ = https.request("http://127.0.0.1:3030/leaderboards/" .. tostring(i))
	print("leaderboard")
	print(data)

	local nodes = {}

	local last = 0;
	for i = 1, 10, 1 do
		print(data)
		local start, _, name = string.find(data, '"name":"([^"]+)"') -- temu json parser
		local _, last, score = string.find(data, '"score":"([^"]+)"') -- temu json parser
		print(name, score)
		if last == nil then
			return nodes
		end
		data = string.sub(data, last);

		table.insert(nodes, {name = name, score = tonumber(score)})
	end
	return nodes
end

function get_user_info(id)
	local https = require("socket.http")
	https.request("")
	return {place = 1};
end
