import os
import subprocess

from libqtile import hook, layout
from libqtile.backend.wayland import InputConfig
from libqtile.config import Match
from modules.keys import *
from modules.screens import *


@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.run(home, check=False)


wl_input_rules = {
    "type:pointer": InputConfig(
        natural_scroll=False,
        pointer_acceleration=False,
    ),
    "*": InputConfig(
        natural_scroll=True,
        tap=True,
        pointer_acceleration=False,
    ),
}


layouts = [
    layout.MonadTall(border_width=3, margin=0, border_focus="#3a3a3a"),
    layout.MonadTall(border_width=3, margin=10, border_focus="#3a3a3a"),
]


dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ],
    border_width=3,
    border_focus="#8ba4b0",
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True

wl_xcursor_theme = None
wl_xcursor_size = 24

# Java
wmname = "LG3D"
