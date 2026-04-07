# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv fish)"

# PATH
fish_add_path $HOME/go/bin
fish_add_path $HOME/.local/bin

# Editor
set -gx EDITOR nvim

# FZF
set -gx FZF_DEFAULT_OPTS "--height 40% --layout=reverse --border"

# Fish colors (Gruvbox)
set -g fish_color_normal      ebdbb2
set -g fish_color_command     b8bb26
set -g fish_color_keyword     fb4934
set -g fish_color_quote       b8bb26
set -g fish_color_redirection d3869b
set -g fish_color_end         fe8019
set -g fish_color_error       fb4934
set -g fish_color_param       ebdbb2
set -g fish_color_comment     928374
set -g fish_color_operator    8ec07c
set -g fish_color_escape      fe8019
set -g fish_color_autosuggestion 7c6f64
set -g fish_color_cwd         fabd2f
set -g fish_color_user        b8bb26
set -g fish_color_host        83a598

# Source private config if it exists
if test -f ~/.private.fish
    source ~/.private.fish
end
