# dotfiles

Personal dotfiles.

## New machine

```sh
# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install packages
brew bundle

# create symlinks
make

# set fish as default shell
chsh -s /opt/homebrew/bin/fish

# start window management services
yabai --start-service
skhd --start-service
```

## Shortcuts

### Window management (skhd + yabai)

| Key | Action |
|-----|--------|
| cmd + hjkl | Focus window |
| cmd + shift + hjkl | Swap window |
| cmd + e | Toggle split |
| alt + f | Fullscreen |
| cmd + shift + t | Toggle float |
| ctrl + shift + hjkl | Resize |
| ctrl + alt + hjkl | Warp |
| shift + alt + e | Balance |
| shift + alt + 1-7 | Move to space |
| shift + alt + p/n | Move to prev/next space |

### tmux (prefix: ctrl+a)

| Key | Action |
|-----|--------|
| prefix + v | Vertical split |
| prefix + s | Horizontal split |
| prefix + hjkl | Navigate panes |
| prefix + HJKL | Resize panes |
| prefix + c | New window |
| prefix + r | Reload config |
