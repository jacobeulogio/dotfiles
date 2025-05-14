# Tmux 
if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ] && [ -z "${TMUX}" ]; then
  if tmux has-session -t main 2>/dev/null; then
    exec tmux attach-session -t main
  else
    exec tmux new-session -s main
  fi
fi

# POWERLEVEL10K
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
source ~/zsh/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# Oh my ZSH
export ZSH="/usr/share/oh-my-zsh"
[[ -z "${plugins[*]}" ]] && plugins=(git fzf extract)
source $ZSH/oh-my-zsh.sh

# Original file location for plugins are in /usr/share/zsh
# ZSH Plugins
source ~/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Commands and Aliases
source ~/zsh/command-not-found.zsh
source ~/zsh/commands.zsh

DISABLE_MAGIC_FUNCTIONS="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# Ignore commands that start with spaces and duplicates.
export HISTCONTROL=ignoreboth

# Don't add certain commands to the history file.
export HISTIGNORE="&:[bf]g:c:clear:history:exit:q:pwd:* --help"

# Use custom `less` colors for `man` pages.
export LESS_TERMCAP_md="$(tput bold 2> /dev/null; tput setaf 2 2> /dev/null)"
export LESS_TERMCAP_me="$(tput sgr0 2> /dev/null)"

# Make new shells get the history lines from all previous
# shells instead of the default "last window closed" history.
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# FZF
export FZF_BASE=~/zsh/fzf                                        #/usr/share/fzf
# export FZF_BASE=/data/data/com.termux/files/usr/share/fzf

# Brew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Atuin
. "$HOME/.atuin/bin/env"
eval "$(atuin init zsh)"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

. "$HOME/.local/bin/env"
eval "$(uv generate-shell-completion zsh)"

eval "$(zoxide init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
