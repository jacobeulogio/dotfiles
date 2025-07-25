# My Dotfiles

A collection of my personal configuration files for various applications.

## Configured Applications

This repository contains configurations for the following applications:

*   **Terminal Emulators:**
    *   Wezterm
*   **Window Managers / Compositors:**
    *   Hyprland (Current daily driver)
    *   Qtile
*   **Text Editors:**
    *   Neovim
*   **Shell:**
    *   Zsh (with Powerlevel10k)
*   **Multiplexer:**
    *   Tmux
*   **Application Launchers / Panels:**
    *   Rofi
    *   Waybar
*   **Other Tools:**
    *   Qutebrowser
    *   SwayNC
    *   Vial
    *   Yazi

## Installation

These dotfiles are managed using GNU Stow.

### 1. Clone the Repository

Clone the repository to your home directory. The `--recurse-submodules` flag is important to ensure all submodules are downloaded.

```bash
git clone --recurse-submodules --remote-submodules https://github.com/jacobeulogio/dotfiles.git ~/dotfiles
```

### 2. Install GNU Stow

If you don't have it already, install GNU Stow. On Arch Linux, you can do this with:

```bash
sudo pacman -S stow
```

### 3. Stow the Dotfiles

Navigate into the cloned directory and use `stow` to create the necessary symlinks.

```bash
cd ~/dotfiles
stow .
```

This will symlink the configuration files to the correct locations in your home directory.
