import traverse
from libqtile import qtile
from libqtile.config import Click, Drag, Group, Key
from libqtile.lazy import lazy

mod = "mod4"
terminal = "wezterm"
browser = "qutebrowser"

keys = [
    # -------------------------------------------------------------
    Key([mod], "h", lazy.function(traverse.left), desc="Move focus to left"),
    Key([mod], "l", lazy.function(traverse.right), desc="Move focus to right"),
    Key([mod], "j", lazy.function(traverse.down), desc="Move focus down"),
    Key([mod], "k", lazy.function(traverse.up), desc="Move focus up"),
    # -------------------------------------------------------------
    # Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    # Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # -------------------------------------------------------------
    Key([mod, "control"], "j", lazy.layout.shrink(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow(), desc="Grow window up"),
    # -------------------------------------------------------------
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod], "t", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "b", lazy.spawn(browser), desc="Launch Browser"),
    Key([mod], "v", lazy.spawn()),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    Key([mod], "space", lazy.spawn("rofi -show run"), desc="Launch Rofi"),
    Key([mod, "shift"], "s", lazy.spawn("flameshot gui"), desc="Screenshot"),
    # -------------------------------------------------------------
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc="Toggle fullscreen on the focused window"),
    Key([mod], "y", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    # -------------------------------------------------------------
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%"), desc="Increase volume"),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%"), desc="Decrease volume"),
    Key([], "XF86AudioMute", lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle"), desc="Toggle mute"),
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%"), desc="Increase brightness"),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set +10%-"), desc="Decrease brightness"),
]


groups = [
    Group("1", spawn="wezterm"),
    Group("2", spawn="qutebrowser"),
    Group("3"),
    Group("4"),
    Group("5"),
]

for group in groups:
    keys.extend(
        [
            Key(
                [mod],
                group.name,
                lazy.group[group.name].toscreen(),
                desc=f"Switch to group {group.name}",
            ),
            Key(
                [mod, "shift"],
                group.name,
                lazy.window.togroup(group.name),
                desc="move focused window to group {}".format(group.name),
            ),
        ],
    )

mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

for vt in range(1, 8):
    keys.append(
        Key(
            ["control", "mod1"],
            f"f{vt}",
            lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
            desc=f"Switch to VT{vt}",
        ),
    )


def swap_screen(qtile):
    i = qtile.screens.index(qtile.current_screen)
    if i == 0:
        qtile.current_group.toscreen(1)
    else:
        qtile.current_group.toscreen(0)


def window_to_left(qtile, switch_group=False, switch_screen=False):
    i = qtile.screens.index(qtile.current_screen)
    leftest_point = qtile.current_screen.info()["x"]
    if qtile.current_window.get_position()[0] > leftest_point:
        qtile.current_layout.shuffle_left()

    elif i + 1 != 0:
        first_screen_position = qtile.screens[0].info()["x"]
        second_screen_position = qtile.screens[1].info()["x"]
        # Check Screen Positions
        target_index_diff = 1 if second_screen_position < first_screen_position else -1
        group = qtile.screens[i + target_index_diff].group.name

        qtile.current_window.togroup(group, switch_group=switch_group)
        if switch_screen:
            qtile.cmd_to_screen(i + target_index_diff)


def window_to_right(qtile, switch_group=False, switch_screen=False):
    i = qtile.screens.index(qtile.current_screen)
    rightest_point = qtile.current_screen.info()["width"] + qtile.current_screen.info()["x"]
    if qtile.current_window.get_position()[0] + qtile.current_window.get_size()[0] < rightest_point - 60:
        qtile.current_layout.shuffle_right()

    elif i + 1 != len(qtile.screens):
        first_screen_position = qtile.screens[0].info()["x"]
        second_screen_position = qtile.screens[1].info()["x"]
        # Check Screen Positions
        target_index_diff = -1 if second_screen_position < first_screen_position else 1
        group = qtile.screens[i + target_index_diff].group.name

        qtile.current_window.togroup(group, switch_group=switch_group)
        if switch_screen:
            qtile.cmd_to_screen(i + target_index_diff)


keys.extend(
    [
        Key([mod], "q", lazy.function(swap_screen), desc="Swap with other screen"),
        # Key([mod, "shift"], "comma", lazy.function(window_to_left)),
        # Key([mod, "shift"], "period", lazy.function(window_to_right)),
        Key([mod, "shift"], "h", lazy.function(window_to_left, switch_screen=True)),
        Key([mod, "shift"], "l", lazy.function(window_to_right, switch_screen=True)),
    ],
)
