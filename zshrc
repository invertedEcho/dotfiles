export PATH="/home/$USER/.local/bin/waybar/:/home/$USER/.local/bin:/home/$USER/bin:/usr/local/bin:/usr/bin:/home/$USER/.local/bin/lua-language-server/bin:/home/$USER/.dotnet/tools/:/home/$USER/.cargo/bin:/home/$USER/.local/bin/codelldb-extension/adapter:$PATH"

eval "$(zoxide init zsh)"
source <(fzf --zsh)
bindkey -e


zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit
compinit

autoload -Uz promptinit
promptinit
prompt pure

alias n='nvim'
alias rm='trash'
alias ".."="cd .."
alias ga="git add ."
alias gp="git pull"
alias gP="git push"
alias gs="git status"
alias gd="git diff"
alias gdc="git diff --cached"
alias t="tmux"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

export EDITOR=/usr/bin/nvim

if ! uname -a | grep -q 'NixOS'; then
  source ~/.cargo/env
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  export PATH="$PATH:/home/$USER/.dotnet/tools"
fi
