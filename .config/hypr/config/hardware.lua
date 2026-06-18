-- Hardware configuration

-- Home Laptop Setup
hl.monitor({
    output   = "HDMI-A-1",
    mode     = "2560x1440@120",
    position = "0x0",
    scale    = 1,
})

hl.monitor({
    output   = "desc:Xiaomi Corporation Mi Monitor 5833410036287",
    mode     = "1920x1080@120",
    position = "-1920x0",
    scale    = 1,
})

hl.monitor({
    output   = "eDP-2",
    mode     = "1920x1200@165",
    position = "auto",
    scale    = 1,
})

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "caps:escape",
        kb_rules   = "",

        follow_mouse = 1,
        sensitivity  = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = true,
        },
    },
})

-- Gestures (commented out)
-- hl.config({
--     gestures = {
--         workspace_swipe = true,
--     },
-- })

-- Device config (empty)
