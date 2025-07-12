local create_UIBox_main_menu_buttons_ref = create_UIBox_main_menu_buttons
function daily_button_color()
	if (G.GAME.Completed_daily) == nil then get_daily_completion() end
	if (not G.GAME.Completed_daily) then return HEX('0faF20') else return HEX('0f0f0f') end
end
function create_UIBox_main_menu_buttons()
	local text_scale = 0.45
	local daily_run_button = UIBox_button({
		id = "daily_run_button",
		minh = 1.35,
		minw = 1.85,
		col = true,
		button = "daily_run_button",
		colour = daily_button_color(),
		label = { "Daily" },
		scale = text_scale * 1.2,
	})
	local menu = create_UIBox_main_menu_buttons_ref()
	local spacer = G.F_QUIT_BUTTON and { n = G.UIT.C, config = { align = "cm", minw = 0.2 }, nodes = {} } or nil
	table.insert(menu.nodes[1].nodes[1].nodes[2].nodes, 2, spacer)
	table.insert(menu.nodes[1].nodes[1].nodes[2].nodes, 3, daily_run_button)
	menu.nodes[1].nodes[1].config =
	{ align = "cm", padding = 0.15, r = 0.1, emboss = 0.1, colour = G.C.L_BLACK, mid = true }
	return menu
end
