G.FUNCS.daily_run_button = function()
	G.GAME.daily_active = true
	G.GAME.can_start_daily = false

	print("daily active")
	local daily_allowed = daily_allowed()
	print("daily_allowedaaa", daily_allowed)
	if daily_allowed then
		print("started daily")
		start_daily()
	else
		open_daily_scores()
	end
end
