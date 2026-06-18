-- Converted Hyprland Lua config
-- Refer to https://wiki.hypr.land/Configuring/Start/
-- Old hyprlang .conf files are kept as backup (.conf.bak)

local terminal = "wezterm"
local browser = "qutebrowser"

require("config/hardware")
require("config/appearance")
require("config/keymaps")
require("config/workspaces")

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("nm-applet & swaync & blueman-applet & hyprpaper & hyprpolkitagent")
    -- hl.exec_cmd("waybar")
    hl.exec_cmd("noctalia")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("sleep 5s && systemctl --user start steam-bigpicture")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Adwaita")

-----------------------
----- PERMISSIONS -----
-----------------------

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")
