export PATH=/home/invertedecho/.local/bin:/home/invertedecho/bin:/usr/local/bin:/usr/bin:/home/invertedecho/.local/bin/lua-language-server/bin:/home/invertedecho/.dotnet/tools/
source ~/.cargo/env

eval "$(zoxide init zsh)"
source <(fzf --zsh)
bindkey -e

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

export PATH="/home/invertedecho/.gdvm/bin/current_godot:/home/invertedecho/.gdvm/bin:$PATH"
export EDITOR=/usr/bin/nvim

source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# needs to be at end of file
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
