# Tmux 
if [ -n "${DISPLAY}" ] && [ -z "${TMUX}" ]; then
  if tmux list-clients -F '#S' | grep "main" 2>/dev/null; then
    i=1
    while [[ $i -lt 100 ]]; do
      if ! tmux list-clients -F '#S' | grep "$i" ; then
        tmux new-session -A -s "$i"
        break
      else 
        ((i++))
      fi
    done
  else
    tmux new-session -A -s main
  fi
fi

# POWERLEVEL10K
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
source $HOME/zsh/powerlevel10k/powerlevel10k.zsh-theme

# Oh my ZSH
export ZSH="$HOME/zsh/oh-my-zsh"
[[ -z "${plugins[*]}" ]] && plugins=(git fzf extract)
source $ZSH/oh-my-zsh.sh

# Original file location for plugins are in /usr/share/zsh
# ZSH Plugins
source ~/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Commands and Aliases
source $HOME/zsh/command-not-found.zsh
source $HOME/zsh/commands.zsh

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

# fzf 
source $HOME/zsh/fzf/completion.zsh
source $HOME/zsh/fzf/key-bindings.zsh

# Brew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Atuin
. "$HOME/.atuin/bin/env"
eval "$(atuin init zsh)"

# uv
. "$HOME/.local/bin/env"
eval "$(uv generate-shell-completion zsh)"

# Zoxide
eval "$(zoxide init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Tmux window naming plugin
tmux-window-name() {
  ($TMUX_PLUGIN_MANAGER_PATH/tmux-window-name/scripts/rename_session_windows.py &)
}
add-zsh-hook chpwd tmux-window-name

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/eulogio/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# >>> conda initialize >>>

# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/eulogio/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/eulogio/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/eulogio/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/eulogio/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

