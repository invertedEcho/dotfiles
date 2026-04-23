export PATH="$PATH:/home/$USER/.local/bin:/home/$USER/bin:/usr/local/bin:/usr/bin:/home/$USER/.local/bin/lua-language-server/bin:/home/$USER/.dotnet/tools/:/home/$USER/.cargo/bin"

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
alias t="tmux"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

export EDITOR=/usr/bin/nvim

if ! hostname | grep -q 'nixos'; then
  source ~/.cargo/env
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  export PATH="$PATH:/home/$USER/.dotnet/tools"
fi
