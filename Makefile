.PHONY: all sync clean

all: sync

sync:
	mkdir -p ~/.config/fish
	mkdir -p ~/.config/ghostty
	mkdir -p ~/.config/rex

	[ -f ~/.config/fish/config.fish ] || ln -s $(PWD)/config.fish ~/.config/fish/config.fish
	[ -d ~/.config/fish/functions ] || ln -s $(PWD)/fish/functions ~/.config/fish/functions
	[ -f ~/.config/ghostty/config ] || ln -s $(PWD)/ghostty.config ~/.config/ghostty/config
	[ -f ~/.gitconfig ] || ln -s $(PWD)/gitconfig ~/.gitconfig
	[ -f ~/.config/rex/init.lua ] || ln -s $(PWD)/rex.lua ~/.config/rex/init.lua
	[ -f ~/.tmux.conf ] || ln -s $(PWD)/tmux.conf ~/.tmux.conf
	[ -f ~/.skhdrc ] || ln -s $(PWD)/skhdrc ~/.skhdrc
	[ -f ~/.yabairc ] || ln -s $(PWD)/yabairc ~/.yabairc
	touch ~/.hushlogin

clean:
	rm -f ~/.config/fish/config.fish
	rm -f ~/.config/fish/functions
	rm -f ~/.config/ghostty/config
	rm -f ~/.gitconfig
	rm -f ~/.config/rex/init.lua
	rm -f ~/.tmux.conf
	rm -f ~/.skhdrc
	rm -f ~/.yabairc
	rm -f ~/.hushlogin
