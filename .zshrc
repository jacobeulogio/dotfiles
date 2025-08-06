### Tmux Auto-start
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


### ZSH Settings
autoload -Uz compinit
compinit

bindkey -e

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

DISABLE_MAGIC_FUNCTIONS="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"


### p10k
source $HOME/zsh/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


### Path
source $HOME/zsh/commands.zsh                                       # Commands and Aliases
export PATH=/home/eulogio/scripts:$PATH                             # Add scripts folder to path
export PATH=/home/eulogio/work-scripts:$PATH                        # Add work-scripts folder to path
export PATH=/home/eulogio/.cargo/bin:$PATH                          # Add work-scripts folder to path


### Env Vars
# export GOOGLE_CLOUD_PROJECT="dashboard-441809"                      # For gemini-cli 
export EDITOR='nvim'


### History
export HISTCONTROL=ignoreboth                                       # Ignore commands that start with spaces and duplicates.
export HISTIGNORE="&:[bf]g:c:clear:history:exit:q:pwd:* --help"     # Don't add certain commands to the history file.
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"                 # Make new shells get the history lines from all previous shells instead of the default "last window closed" history.


### Cli Integrations
eval "$(direnv hook zsh)"
source <(fzf --zsh)
eval "$(atuin init zsh)"
eval "$(uv generate-shell-completion zsh)"
eval "$(zoxide init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ -f '/home/eulogio/google-cloud-sdk/path.zsh.inc' ];
then . '/home/eulogio/google-cloud-sdk/path.zsh.inc';
fi

if [ -f '/home/eulogio/google-cloud-sdk/completion.zsh.inc' ]; 
  then . '/home/eulogio/google-cloud-sdk/completion.zsh.inc';
fi


### Plugins
source ~/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source ~/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
