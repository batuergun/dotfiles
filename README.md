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

# start screenshot sync to b2
launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/com.batuhanergun.screenshot-sync.plist
```

## Screenshot sync

Screenshots save to `/Users/Shared/Screenshots`. A launch agent (`screenshots/sync.sh`, fswatch + rsync over SSH to `b2t`) mirrors that folder to the same path on b2, so a screenshot dropped into a b2 Rex session pastes a path that exists there. Log: `/tmp/screenshot-sync.log`.

## Shortcuts

### Window management (skhd + yabai)

| Key | Action |
|-----|--------|
| cmd + hjkl | Focus window (in Rex: focus split, then window at the edge) |
| cmd + shift + hjkl | Swap window (in Rex: move split, then swap window at the edge) |
| cmd + s/g | Focus display left/right |
| cmd + shift + s/g | Move window to display left/right |
| cmd + r | Shortcat passthrough |
| cmd + e | Toggle split |
| alt + f | Fullscreen |
| cmd + shift + t | Toggle float |
| ctrl + shift + hjkl | Resize |
| ctrl + alt + hjkl | Warp |
| shift + alt + e | Balance |
| shift + alt + 1-7 | Move to space |
| shift + alt + p/n | Move to prev/next space |

### Rex

Rex defaults, plus `rex.lua`:

| Key | Action |
|-----|--------|
| cmd + d / cmd + shift + d | Split right / down |
| cmd + hjkl | Focus split |
| cmd + shift + hjkl | Move split |
| cmd + t / cmd + w | New tab / close pane |
| cmd + 1-9 | Switch to tab |
| ctrl + cmd + [ / ] | Move tab left / right |
| ctrl + cmd + r | Rename tab |
| cmd + p | Session picker |
| cmd + shift + p | Command palette |

### tmux (prefix: ctrl+f)

| Key | Action |
|-----|--------|
| prefix + v | Vertical split |
| prefix + s | Horizontal split |
| prefix + hjkl | Navigate panes |
| prefix + HJKL | Resize panes |
| prefix + c | New window |
| prefix + r | Reload config |

### Ghostty (mapped to tmux)

| Key | Action |
|-----|--------|
| cmd + t | New window |
| cmd + w | Close pane |
| cmd + 1-9 | Switch to window |

### Fish functions

| Command | Action |
|---------|--------|
| `wm-stop` | Stop yabai + skhd (e.g. for Logic Pro) |
| `wm-start` | Start yabai + skhd and reload yabairc |

### Git aliases

| Alias | Command |
|-------|---------|
| `git st` | `status -sb` |
| `git ci` | `commit` |
| `git co` | `checkout` |
| `git di` | `diff` |
| `git lg` | `log -p` |
| `git lol` | `log --graph --decorate --pretty=oneline --abbrev-commit` |
| `git unstage` | `reset HEAD --` |
| `git discard` | `checkout --` |
