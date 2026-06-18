-- Keybindings

local mainMod = "SUPER"
local menu = "rofi -show run"
local dmenu = "rofi -show drun"
local clipboard = "cliphist list | rofi -dmenu | cliphist decode | wl-copy"

-- Nocatalia
-- local dmenu = "noctalia msg panel-toggle launcher"
-- local clipboard = "noctalia msg panel-toggle clipboard"
local settings = "noctalia msg settings-toggle"


hl.config({
	binds = {
		allow_workspace_cycles = true,
	},
})

-- Function keys
hl.bind(mainMod .. " + F1", hl.dsp.exec_cmd("~/.config/hypr/scripts/launch-waybar.sh"))
hl.bind(mainMod .. " + F2", hl.dsp.exec_cmd("hyprctl keyword monitor eDP-2,preferred,auto,1"))
hl.bind(mainMod .. " + F3", hl.dsp.exec_cmd("hyprctl keyword monitor eDP-2,disable"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd('grim -g "$(slurp -w 1)" - | wl-copy'))

-- App launchers
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("wezterm"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("qutebrowser"))
hl.bind(
	mainMod .. " + CTRL + B",
	hl.dsp.exec_cmd("QTWEBENGINE_FORCE_USE_GBM=1 qutebrowser --qt-flag disable-accelerated-video-decode")
)

-- Window / Session management
hl.bind(mainMod .. " + CTRL + Q", hl.dsp.exit())
hl.bind(mainMod .. " + W", hl.dsp.window.close())
hl.bind(mainMod .. " + Y", hl.dsp.window.float({ action = "toggle" }))

hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = 1 }))

-- noctalia 
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(clipboard))
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd(dmenu))
hl.bind(mainMod .. "+ CTRL + S", hl.dsp.exec_cmd(settings))

hl.bind(mainMod .. " + S", hl.dsp.workspace.swap_monitors({monitor1="current", monitor2="+1"}))
hl.bind(mainMod .. " + E", hl.dsp.focus({ workspace = "empty", current_monitor = true }))
hl.bind(mainMod .. " + Q", hl.dsp.focus({ workspace = "previous" }))

-- Move window
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))

-- Move focus
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))

-- Resize window
hl.bind(mainMod .. " + CTRL + h", hl.dsp.exec_cmd("hyprctl dispatch resizeactive -40 0"))
hl.bind(mainMod .. " + CTRL + j", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 40"))
hl.bind(mainMod .. " + CTRL + k", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 -40"))
hl.bind(mainMod .. " + CTRL + l", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 40 0"))

-- Switch workspaces with mainMod + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i, on_current_monitor = true }))
end

hl.bind(mainMod .. " + I", hl.dsp.focus({ workspace = "e-1", on_current_monitor = true }))
hl.bind(mainMod .. " + O", hl.dsp.focus({ workspace = "e+1", on_current_monitor = true }))

-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + SHIFT + I", hl.dsp.window.move({ workspace = "e-1" }))
hl.bind(mainMod .. " + SHIFT + O", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.window.move({ workspace = "empty" }))

-- Special workspaces
hl.bind(mainMod .. " + C", hl.dsp.workspace.toggle_special("opencode"))
hl.bind(mainMod .. " + D", hl.dsp.workspace.toggle_special("todo"))
hl.bind(mainMod .. " + N", hl.dsp.workspace.toggle_special("nixsearch"))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind("SHIFT + ALT + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SHIFT + ALT + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -n2 set 10%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -n2 set 10%-"), { locked = true, repeating = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
