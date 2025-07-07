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

autoload -Uz compinit
compinit

# Oh my ZSH
export ZSH="$HOME/zsh/oh-my-zsh"
[[ -z "${plugins[*]}" ]] && plugins=(git fzf)
source $ZSH/oh-my-zsh.sh


# p10k
source $HOME/zsh/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Envionment Vars
export EDITOR='nvim'
export PATH=/home/eulogio/scripts:$PATH                             # Add scripts folder to path
export PATH=/home/eulogio/work-scripts:$PATH                        # Add work-scripts folder to path
export GOOGLE_CLOUD_PROJECT="dashboard-441809"

DISABLE_MAGIC_FUNCTIONS="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# History
export HISTCONTROL=ignoreboth                                       # Ignore commands that start with spaces and duplicates.
export HISTIGNORE="&:[bf]g:c:clear:history:exit:q:pwd:* --help"     # Don't add certain commands to the history file.
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"                 # Make new shells get the history lines from all previous shells instead of the default "last window closed" history.

# Use custom `less` colors for `man` pages.
export LESS_TERMCAP_md="$(tput bold 2> /dev/null; tput setaf 2 2> /dev/null)"
export LESS_TERMCAP_me="$(tput sgr0 2> /dev/null)"

# . "$HOME/.atuin/bin/env"
# . "$HOME/.local/bin/env"
source <(fzf --zsh)
eval "$(atuin init zsh)"
eval "$(uv generate-shell-completion zsh)"
eval "$(zoxide init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Updates PATH for the Google Cloud SDK & Enables shell command completion.
if [ -f '/home/eulogio/google-cloud-sdk/path.zsh.inc' ];
then . '/home/eulogio/google-cloud-sdk/path.zsh.inc';
fi

if [ -f '/home/eulogio/google-cloud-sdk/completion.zsh.inc' ]; 
  then . '/home/eulogio/google-cloud-sdk/completion.zsh.inc';
fi

source $HOME/zsh/commands.zsh                                       # Commands and Aliases
source ~/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source ~/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
