.PHONY: all sync clean

# Link a repo file into place. A real file at the target is left alone with a
# warning, since it would otherwise silently shadow the repo version.
link = @if [ -L $(2) ]; then :; \
	elif [ -e $(2) ]; then echo "! $(2) is a real file, not a link to the repo. Move it aside and run make again." >&2; \
	else ln -s $(PWD)/$(1) $(2) && echo "+ $(2) -> $(1)"; fi

all: sync

sync:
	mkdir -p ~/.config/fish
	mkdir -p ~/.config/ghostty
	mkdir -p ~/.config/rex

	$(call link,config.fish,~/.config/fish/config.fish)
	$(call link,fish/functions,~/.config/fish/functions)
	$(call link,ghostty.config,~/.config/ghostty/config)
	$(call link,gitconfig,~/.gitconfig)
	$(call link,rex.lua,~/.config/rex/init.lua)
	$(call link,tmux.conf,~/.tmux.conf)
	$(call link,skhdrc,~/.skhdrc)
	$(call link,yabairc,~/.yabairc)
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
