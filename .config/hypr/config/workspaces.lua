-- Windows and Workspaces
--
hl.workspace_rule({ workspace = "1", persistent = true })
hl.workspace_rule({ workspace = "2", persistent = true })
hl.workspace_rule({ workspace = "3", persistent = true })
hl.workspace_rule({ workspace = "4", persistent = true })
hl.workspace_rule({ workspace = "5", persistent = true })
hl.workspace_rule({ workspace = "6", persistent = true })
hl.workspace_rule({ workspace = "7", persistent = true })
hl.workspace_rule({ workspace = "8", persistent = true })
hl.workspace_rule({ workspace = "9", persistent = true })

hl.config({
    dwindle = {
        preserve_split = true,
    },
})

hl.config({
    master = {
        new_status = "slave",
    },
})

-- Special workspaces
hl.workspace_rule({
    workspace          = "special:opencode",
    on_created_empty   = [[wezterm start tmux new-session -As opencode 'opencode $(fd --hidden --type d --max-depth 3 . ~ | fzf --tmux || echo '~') && ']],
    gaps_out           = 20,
})

hl.workspace_rule({
    workspace          = "special:todo",
    on_created_empty   = [[wezterm start tmux new-session -As todo 'nvim ~/projects/todo/todo.md']],
    gaps_out           = 20,
})

hl.workspace_rule({
    workspace          = "special:nixsearch",
    on_created_empty   = [[qutebrowser --target window 'https://search.nixos.org/packages']],
    gaps_out           = 10,
})

-- "Smart Borders"
hl.window_rule({
    name  = "smart-borders-wt1",
    match = { float = false, workspace = "w[t1]" },
    border_size = 0,
})

hl.window_rule({
    name  = "smart-borders-wtg1",
    match = { float = false, workspace = "w[tg1]" },
    border_size = 0,
})

hl.window_rule({
    name  = "smart-borders-f1",
    match = { float = false, workspace = "f[1]" },
    border_size = 0,
})

-- Add border to special workspaces (commented out)
-- hl.window_rule({
--     name  = "border-todo",
--     match = { workspace = "special:todo" },
--     border_size = 2,
-- })
-- hl.window_rule({
--     name  = "border-nixsearch",
--     match = { workspace = "special:nixsearch" },
--     border_size = 2,
-- })
-- hl.window_rule({
--     name  = "border-opencode",
--     match = { workspace = "special:opencode" },
--     border_size = 2,
-- })

-- hl.window_rule({
--     name  = "suppress-maximize",
--     match = { class = ".*" },
--     suppress_event = "maximize",
-- })

-- Make File Manager Floating
hl.window_rule({
    name  = "float-nautilus",
    match = { class = "^(org.gnome.Nautilus)$" },
    float = true,
})

hl.window_rule({
    name  = "float-xdg-portal",
    match = { class = "^(xdg-desktop-portal-gnome)$" },
    float = true,
})

hl.window_rule({
    name  = "float-setup-temp",
    match = { class = "setup.temp" },
    float = true,
})

-- Fix some dragging issues with XWayland (commented out)
-- hl.window_rule({
--     name  = "fix-xwayland-drags",
--     match = {
--         class      = "^$",
--         title      = "^$",
--         xwayland   = true,
--         float      = true,
--         fullscreen = false,
--         pin        = false,
--     },
--     no_focus = true,
-- })

-- hl.window_rule({
--     name  = "noblur-rofi",
--     match = { class = "^(rofi)$" },
--     blur = false,
-- })

-- Wayland Video Bridge White Box (commented out)
-- hl.window_rule({
--     name  = "xwaylandvideobridge-opacity",
--     match = { class = "^(xwaylandvideobridge)$" },
--     opacity = 0.0,
-- })
-- hl.window_rule({
--     name  = "xwaylandvideobridge-noanim",
--     match = { class = "^(xwaylandvideobridge)$" },
--     no_anim = true,
-- })
-- hl.window_rule({
--     name  = "xwaylandvideobridge-noinitfocus",
--     match = { class = "^(xwaylandvideobridge)$" },
--     no_initial_focus = true,
-- })
-- hl.window_rule({
--     name  = "xwaylandvideobridge-maxsize",
--     match = { class = "^(xwaylandvideobridge)$" },
--     max_size = "1 1",
-- })
-- hl.window_rule({
--     name  = "xwaylandvideobridge-noblur",
--     match = { class = "^(xwaylandvideobridge)$" },
--     blur = false,
-- })
-- hl.window_rule({
--     name  = "xwaylandvideobridge-nofocus",
--     match = { class = "^(xwaylandvideobridge)$" },
--     no_focus = true,
-- })
