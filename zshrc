export PATH=/home/$USER/.local/bin:/home/$USER/bin:/usr/local/bin:/usr/bin:/home/$USER/.local/bin/lua-language-server/bin:/home/$USER/.dotnet/tools/
source ~/.cargo/env

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
alias lg='lazygit'
alias rm='trash'
alias ".."="cd .."
alias ga="git add ."
alias gp="git pull"
alias gP="git push"
alias cr="cargo run"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

export EDITOR=/usr/bin/nvim

source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# needs to be at end of file
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH="$PATH:/home/$USER/.dotnet/tools"
