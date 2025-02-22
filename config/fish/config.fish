if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Erase fish_greeting
set fish_greeting

alias mux='pgrep -vx tmux > /dev/null && \
        tmux new -d -s delete-me && \
        tmux run-shell ~/.config/tmux/plugins/tmux-resurrect/scripts/restore.sh && \
        tmux kill-session -t delete-me && \
        tmux attach || tmux attach'

export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
export PATH="/home/arthur/.local/share/GoLand-2024.2.3/bin/:$PATH"
export EDITOR="nvim"
alias oo='cd ~/Obsidian/ && nvim'

# Rye
set -Ua fish_user_paths "$HOME/.rye/shims"
export RYE_NO_AUTO_INSTALL=1

# zoxide initialization
zoxide init --cmd cd fish | source
starship init fish | source
direnv hook fish | source
