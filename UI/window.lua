function open_daily_scores()
	print("scoreboard")
	return UIBox({
		definition = get_scoreboard(),
		config = {type = "cm"}
	})
end

function get_scoreboard()
	return {n = G.UIT.ROOT, config = {r = 0.1, minw = 8, minh = 6, align = "tm", padding = 0.2, colour = G.C.BLACK}, nodes = {
		{n = G.UIT.C, config = {minw=4, minh=4, colour = G.C.MONEY, padding = 0.15}, nodes = {
			{n = G.UIT.R, config = {minw=2, minh=2, colour = G.C.RED, padding = 0.15}, nodes = {
				{n = G.UIT.C, config = {minw=1, minh=1, colour = G.C.BLUE, padding = 0.15}},
				{n = G.UIT.C, config = {minw=1, minh=1, colour = G.C.BLUE, padding = 0.15}}
			}},
			{n = G.UIT.R, config = {minw=2, minh=1, colour = G.C.RED, padding = 0.15}, nodes = {
				{n = G.UIT.C, config = {minw=1, minh=1, colour = G.C.BLUE, padding = 0.15}},
				{n = G.UIT.C, config = {minw=1, minh=1, colour = G.C.BLUE, padding = 0.15}}
			}}
		}}
	}}
end
