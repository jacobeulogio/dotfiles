import eulogio_o.draw

# Load existing settings made via :set
config.load_autoconfig()

eulogio_o.draw.colors(c, {"spacing": {"vertical": 6, "horizontal": 8}})

config.bind("<Ctrl-Shift-m>", "spawn mpv {url}")
config.bind("<Shift-m>", "hint links spawn mpv {hint-url}")

# # Hardware Acceleration
# config.set(
#     "qt.args",
#     [
#         "ignore-gpu-blocklist",
#         "enable-gpu-rasterization",
#         "enable-accelerated-video-decode",
#         "enable-quic",
#         "enable-zero-copy",
#     ],
# )

c.aliases = {
    "e": "session-load",
    "w": "session-save",
    "q": "close",
    "qa": "quit",
    "wq": "quit --save",
    "wqa": "quit --save",
}
