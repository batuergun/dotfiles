# PATH
fish_add_path /opt/homebrew/bin
fish_add_path $HOME/go/bin
fish_add_path $HOME/.local/bin

# Editor
set -gx EDITOR nvim

# FZF
set -gx FZF_DEFAULT_OPTS "--height 40% --layout=reverse --border"

# Source private config if it exists
if test -f ~/.private.fish
    source ~/.private.fish
end
