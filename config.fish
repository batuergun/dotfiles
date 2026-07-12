# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv fish)"

# PATH
fish_add_path $HOME/go/bin
fish_add_path $HOME/.local/bin

# Land interactive SSH logins in a persistent tmux session so long-running
# work (Claude Code) outlives client disconnects. exec so quitting tmux ends
# the SSH session cleanly; skip when already inside tmux to avoid nesting.
if status is-interactive; and set -q SSH_CONNECTION; and not set -q TMUX
    exec tmux new -A -s main
end

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

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
