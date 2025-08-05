# Aliases
alias tm="tmux new-session -A -s main"
alias ipython="ipython --no-autoindent"
alias cl="clear"
alias cd="z"
alias ruff_init="cp ~/dotfiles/.ruff.toml ."
alias refresh_fonts="rm -rf ~/.local/share/fonts/fonts && ln -s /run/current-system/sw/share/X11/fonts ~/.local/share/fonts"
alias ga="git add"
alias gc="git commit"
alias gp="git push"

# dev flake templates
function dev_init() {
  language=$1
  cp ~/nixos/templates/$language.nix . 
}

function template() {
  language=$1
  nix flake init --template "https://flakehub.com/f/the-nix-way/dev-templates/*#$language"
}

# update system
function update() {
  local HOST_FILE="${XDG_RUNTIME_DIR:-$HOME}/nix_host"
  local host=${1:-$(cat "$HOST_FILE" 2>/dev/null)}

  if [[ -z "$host" ]]; then
    read 'host?Set default host: ' || return 1
    echo "$host" > "$HOST_FILE"
  fi

  (
    set -e 
    cd ~/nixos
    echo "Updating host: $host"
    sudo nix flake update
    sudo nixos-rebuild switch --flake ".#$host" --upgrade --no-reexec
  ) && echo "Update successful." || echo "Update failed."
}

# Yazi
function e() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# venv wrapper
export VENV_HOME="$HOME/.virtualenvs"
[[ -d $VENV_HOME ]] || mkdir $VENV_HOME

lsvenv() {
  ls -1 $VENV_HOME
}

venv() {
  if [ $# -eq 0 ]
    then
      echo "Please provide venv name"
    else
      source "$VENV_HOME/$1/bin/activate"
  fi
}

mkvenv() {
  if [ $# -eq 0 ]
    then
      echo "Please provide venv name"
    else
      python3 -m venv $VENV_HOME/$1
  fi
}

rmvenv() {
  if [ $# -eq 0 ]
    then
      echo "Please provide venv name"
    else
      rm -r $VENV_HOME/$1
  fi
}
