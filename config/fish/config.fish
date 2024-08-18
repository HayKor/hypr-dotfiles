if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Erase fish_greeting
set fish_greeting
# zoxide initialization
zoxide init --cmd cd fish | source
