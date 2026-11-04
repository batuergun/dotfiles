#!/bin/sh
# Mirror the shared screenshot folder to b2 at the same path, so a screenshot
# dropped into a b2 terminal pastes a path that exists there.

dir=/Users/Shared/Screenshots
host=b2t

push() {
	/usr/bin/rsync -a --delete --exclude '.*' \
		-e '/usr/bin/ssh -o BatchMode=yes -o ConnectTimeout=5' \
		"$dir/" "$host:$dir/"
}

push
/opt/homebrew/bin/fswatch -o -l 0.2 "$dir" | while read -r _; do push; done
