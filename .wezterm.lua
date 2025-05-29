local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.default_domain = "local"

config.initial_cols = 180
config.initial_rows = 46

config.font_size = 13

config.font = wezterm.font("JetBrains Mono")

config.color_scheme = "Kanagawa Dragon (Gogh)"
config.colors = {
	background = "black",
	cursor_bg = "silver",
	cursor_border = "silver",
	selection_fg = "black",
}

config.enable_tab_bar = false

config.window_background_opacity = 0.9

config.window_close_confirmation = "NeverPrompt"

config.window_padding = {
	left = "0.5cell",
	right = "0.5cell",
	top = "25px",
	bottom = "0px",
}

return config
