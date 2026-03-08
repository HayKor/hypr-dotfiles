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
export PATH="/home/arthur/.cargo/bin:$PATH"
export PATH="/home/arthur/Scripts/:$PATH"
export EDITOR="nvim"

export JAVA_HOME="/usr/lib/jvm/java-8-openjdk"


alias oo='cd ~/Obsidian/ && nvim'

# zoxide initialization
zoxide init --cmd cd fish | source
starship init fish | source
direnv hook fish | source
