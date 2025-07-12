require "io"

function get_daily_completion()
	local file = io.open("daily_mod_save", "w")
	if file:read() == "true" then
		G.GAME.Completed_daily = true;
	end
	file.close()
end
