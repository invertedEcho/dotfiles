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
alias cb="cargo build"

alias ct="clear && tmux clear-hist"

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

# autostart tmux under following conditions: 1. tmux exists 2. were in an interactive shell 3. tmux doesnt try to run within itself
# 4. we are not starting from vscode. vscode seems to set no_new_privs, so if vscode starts first, and a terminal is started normally, it will be in the same tmux server, and thus inheriting the no_new_privs flag, preventing it from running sudo.
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ] && [ "$TERM_PROGRAM" != "vscode" ]; then
  exec tmux
fi
