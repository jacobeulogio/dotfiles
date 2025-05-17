#!/bin/bash

# brew 
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# yazi
sudo pacman -S yazi ffmpeg 7zip jq poppler fd ripgrep fzf zoxide imagemagick
paru -S resvg

# yazi plugins
ya pack -a llanosrocas/githead
echo "require("githead"):setup()" >> ~/.config/yazi/init.lua

# atuin
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
