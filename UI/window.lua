function open_daily_scores()
	print("scoreboard")
	G.FUNCS.overlay_menu({
		definition = get_scoreboard(),
	})
	-- 	definition = get_scoreboard(),
	-- 	config = {align = "cm"}
	-- })
end

function get_scoreboard()
	return {n = G.UIT.ROOT, config = {r = 0.1, minw = 18, minh = 11.5, maxh = 11.5, align = "cm", padding = 0.0, colour = G.C.BLACK, outline_colour = HEX("B9C2D2FF"), outline = 1}, 
	nodes = {
			{n = G.UIT.C, config = {minw = 5, minh = 8, colour = G.C.DEBUG_WHITE, align = "cm", padding = .15}, nodes = get_user_info_board()},
			{n = G.UIT.C, config = {minw = 13, minh = 9, align = "cm", padding = 0.1, colour = G.C.DEBUG_WHITE}, nodes = get_scores(0) }
		}
	}
end

function get_user_info_board()
	local player_place = 1; --DEBUG
	return {
		{n=G.UIT.R, config = {padding = .15, r=.1, minw = 4, maxw = 4, minh = 3, maxh = 3, colour = G.C.UI.BACKGROUND_DARK, outline = .5, outline_colour = G.C.UI.BACKGROUND_LIGHT, align = "cm"}, nodes = {
			{n=G.UIT.T, config = {text = "#" .. player_place, scale = 3.5, colour = get_place_color(player_place)}}
		}},
		{n=G.UIT.R, config = {r=.1, minw = 4, maxw = 4, minh = 1, maxh = 1, colour = G.C.UI.BACKGROUND_DARK, outline = .5, outline_colour = G.C.UI.BACKGROUND_LIGHT, align = "cm"}, nodes = {
			{n=G.UIT.T, config = {text = G.DAILY.name, scale = 1, colour = G.C.WHITE}}
		}},
		{n=G.UIT.R, config = {minh = 6, maxh = 6, minw = 3, maxw = 3, colour = G.C.DEBUG_WHITE, padding = .15, align = "tm"}, nodes = get_player_score_board()},
	}
end

function get_player_score_board()
	return {
		{n = G.UIT.R, config = {align = "cm", r=.25,minw = 4, maxw = 4, minh = 1, maxh = 1, colour = G.C.UI.BACKGROUND_DARK, outline_colour = G.C.UI.BACKGROUND_LIGHT, outline = 1}, nodes = {
			{n = G.UIT.C, config = {}, nodes = {
				{n = G.UIT.T, config = {text = "Best Hand: " .. G.DAILY.best_hand, colour = G.C.WHITE, scale = 1}}}}
		}},
		{n = G.UIT.R, config = {align = "cm", r=.25,minw = 4, maxw = 4, minh = 1, maxh = 1, colour = G.C.UI.BACKGROUND_DARK, outline_colour = G.C.UI.BACKGROUND_LIGHT, outline = 1}, nodes = {
			{n = G.UIT.C, config = {}, nodes = {
				{n = G.UIT.T, config = {text = "Ante: " .. G.DAILY.ante, colour = G.C.WHITE, scale = 1}}}}
		}},
		-- CONTROLS GO HERE
	}
end

function get_scores(i)
	local nodes =  {}
	local scores = get_leaderboard_scores(i)
	for index, value in ipairs(scores) do
		table.insert(nodes, build_score_card(index, value.name, value.score))
	end
	return nodes
end

function build_score_card(place, name, score)
	return {n = G.UIT.R, config = {r =.1, minw=12, minh=.7, colour = G.C.UI.BACKGROUND_DARK, padding = 0.15, outline_colour = G.C.UI.BACKGROUND_LIGHT, outline = .5}, nodes = {
		{n = G.UIT.C, config = {r = .1, maxw = 1, maxh = .6, minw = 1, minh = .6, colour = get_place_color(place), align = "cm", juice = juice_place(place)}, nodes = {
			{n = G.UIT.T, config = {text = place, colour = G.C.UI.WHITE, scale = .5, align = "bm", juice = juice_place(place)}}
		}},
		{n = G.UIT.C, config = {r = .1, maxw = 3, maxh = .6, minw = 3, minh = .6, padding = 0, colour = G.C.UI.TEXT_DARK, align = "cm"}, nodes = {
			{n = G.UIT.T, config = { text = name, colour = G.C.UI.WHITE, scale = .5, align = "bm"}}}},

			{n = G.UIT.C, config = {r = .1, minw = 8, minh = .6, maxw = 8, maxh = .6, padding = 0.15, colour = G.C.UI.TEXT_DARK, align = "cm"}, nodes = {
				{n = G.UIT.T, config = { text = "SCORE: " .. score, colour = G.C.UI.WHITE, scale = .5, align = "bm"}}}},
			}}
		end

		function get_place_color(place)
			if place == 1 then
				return G.C.GOLD -- why gold no shiny D:
			elseif place == 2 then
				return G.C.ORANGE
			elseif place == 3 then
				return G.C.PURPLE
			elseif place == 4 then
				return G.C.BLUE
			elseif place == 5 then
				return G.C.BLACK
			elseif place == 6 then
				return G.C.GREEN
			elseif place == 7 then
				return G.C.RED
			end
			return HEX("3f3f3f3f")
		end

		-- doesent work but also I cant be bothered
		function juice_place(place)
			return place == 1
		end
