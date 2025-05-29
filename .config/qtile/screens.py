from libqtile import bar, qtile, widget
from libqtile.config import Screen
from qtile_extras.widget import Bluetooth, StatusNotifier, UPowerWidget, WiFiIcon

font = "SF Pro Text"
wallpaper = "~/.config/qtile/baguio.jpg"

widget_defaults = dict(
    font=font,
    fontsize=15,
    padding=4,
    foreground="#c6c6c6",
)
extension_defaults = widget_defaults.copy()
sep = widget.Sep(linewidth=2, foreground="000000")


def battery():
    if qtile.core.name == "x11":
        return widget.Spacer(length=0)
    if qtile.core.name == "wayland":
        return widget.Battery(
            format=" {watt:.2f} W   {percent:2.0%} {char} ",
            charge_char="󱐋",
            discharge_char="",
            not_charging_char="󱐋",
            update_interval=4,
        )
    return None


def systray():
    if qtile.core.name == "x11":
        return widget.Systray(icon_size=28)
    if qtile.core.name == "wayland":
        return StatusNotifier(icon_theme="Papirus", icon_size=28)
    return None


widgets = [
    widget.GroupBox(
        highlight_method="line",
        active="#ffffff",
        inactive="#888888",
        highlight_color="000000",
        this_screen_border="#8ba4b0",
        this_current_screen_border="#8ba4b0",
        font="SF Pro Display Light",
        padding=6,
        # hide_unused=True,
    ),
    sep,
    widget.TextBox("", fontsize=20),
    widget.DF(visible_on_warn=False, format=" {uf}{m} | {r:.0f}% "),
    widget.TextBox(" ", fontsize=20),
    widget.Memory(
        measure_mem="G",
        format="{MemUsed: .1f} |{MemTotal: .1f}{mm}",
        update_interval=4,
    ),
    sep,
    widget.TextBox("󰍛 ", fontsize=24),
    widget.CPU(
        format="{load_percent}% ",
        update_interval=2,
    ),
    widget.Spacer(),
    Bluetooth(default_text="󰂯", fontsize=20),
    widget.Net(
        interface="all",
        update_interval=4,
        format="  {down:3.1f}{down_suffix:<2}↓ ",
    ),
    StatusNotifier(icon_theme="Papirus", icon_size=28),
    battery(),
    UPowerWidget(border_charge_colour="#dbdbe0"),
    sep,
    widget.Clock(fontsize=16, format=" %a, %b %d   %I:%M %p    "),
]

screens = [
    Screen(
        wallpaper=wallpaper,
        top=bar.Bar(
            widgets,
            30,
            opacity=0.90,
            padding=20,
            background="#000000",
        ),
    ),
    Screen(
        wallpaper=wallpaper,
        # top=bar.Bar(
        #     widgets,
        #     30,
        #     opacity=0.90,
        #     padding=20,
        #     background="#000000",
        # ),
    ),
]
