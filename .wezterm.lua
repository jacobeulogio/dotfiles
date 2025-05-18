local wezterm = require("wezterm")
local config = wezterm.config_builder()

return {

	initial_cols = 180,
	initial_rows = 47,

	font_size = 13,
	font = wezterm.font("JetBrains Mono"),

	color_scheme = "Kanagawa Dragon (Gogh)",
	colors = {
		background = "#000000", -- black
	},

	enable_tab_bar = false,

	window_background_opacity = 0.90,
}
