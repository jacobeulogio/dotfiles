local wezterm = require("wezterm")
local config = wezterm.config_builder()

local is_windows = wezterm.target_triple:find("windows") ~= nil
if is_windows then
	config.default_domain = "WSL:Ubuntu"
else
	config.default_domain = "local"
end

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

config.window_background_opacity = 0.95

config.window_close_confirmation = "NeverPrompt"

return config
