from libqtile import bar, widget
from libqtile.config import Click, Drag, Match, Screen
from qtile_extras.widget import StatusNotifier, UPowerWidget, WiFiIcon

font = "SF Pro Text SemiBold"
wallpaper = "~/.config/qtile/baguio.jpg"

widget_defaults = dict(
    font=font,
    fontsize=14,
    padding=4,
)
extension_defaults = widget_defaults.copy()

widgets = [
    widget.GroupBox(
        highlight_method="line",
        active="#ffffff",
        inactive="#888888",
        highlight_color="000000",
        this_current_screen_border="#8ba4b0",
        font="SF Pro Display",
    ),
    widget.Spacer(),
    widget.Spacer(length=1),
    StatusNotifier(icon_theme="Papirus", icon_size=20),
    widget.Net(
        interface="all",
        update_interval=4,
        format="{down:3.1f}{down_suffix:<2}↓",
    ),
    WiFiIcon(update_interval=5),
    widget.Battery(
        format="{watt:.2f} W  {percent:2.0%} {char}",
        charge_char="󱐋",
        discharge_char="",
        not_charging_char="󱐋",
        update_interval=4,
    ),
    UPowerWidget(border_charge_colour="#dbdbe0"),
    widget.Clock(format=" %a, %b %d  %I:%M %p "),
]

screens = [
    Screen(
        wallpaper=wallpaper,
        top=bar.Bar(
            widgets,
            24,
            opacity=0.95,
            padding=20,
            background="#000000",
        ),
    ),
    Screen(
        wallpaper=wallpaper,
        top=bar.Bar(
            widgets,
            24,
            opacity=0.95,
            kadding=20,
            background="#000000",
        ),
    ),
]
