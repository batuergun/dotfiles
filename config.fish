# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv fish)"

# PATH
fish_add_path $HOME/go/bin
fish_add_path $HOME/.local/bin

# Editor
set -gx EDITOR nvim

# FZF
set -gx FZF_DEFAULT_OPTS "--height 40% --layout=reverse --border"

# Fish colors (use terminal ANSI palette)
set -g fish_color_normal         normal
set -g fish_color_command        green
set -g fish_color_keyword        red
set -g fish_color_quote          green
set -g fish_color_redirection    magenta
set -g fish_color_end            yellow
set -g fish_color_error          red
set -g fish_color_param          normal
set -g fish_color_comment        brblack
set -g fish_color_operator       cyan
set -g fish_color_escape         yellow
set -g fish_color_autosuggestion brblack
set -g fish_color_cwd            yellow
set -g fish_color_user           green
set -g fish_color_host           blue

# Source private config if it exists
if test -f ~/.private.fish
    source ~/.private.fish
end
