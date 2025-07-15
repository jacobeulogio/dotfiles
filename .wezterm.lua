local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.default_domain = "local"

config.initial_cols = 180
config.initial_rows = 46

config.font_size = 13

-- config.font = wezterm.font("Cousine Nerd Font Mono")
config.font = wezterm.font("GeistMono Nerd Font Mono")
-- config.font = wezterm.font("CommitMono Nerd Font")
-- config.font = wezterm.font("Hack Nerd Font Mono")
-- config.font = wezterm.font("JetBrainsMono Nerd Font", {weight="Light", stretch="Normal", style="Normal"})

config.color_scheme = "Kanagawa Dragon (Gogh)"
config.colors = {
	background = "black",
	cursor_bg = "silver",
	cursor_border = "silver",
	selection_fg = "black",
}

config.enable_tab_bar = false

config.window_background_opacity = 0.95

config.window_close_confirmation = "NeverPrompt"

config.window_padding = {
	left = "0.2cell",
	right = "0.2cell",
	top = "8px",
	bottom = "1px",
}

return config
