#!/bin/sh
# Mirror the shared screenshot folder to b2 at the same path, so a screenshot
# dropped into a b2 terminal pastes a path that exists there.
#
# /Users/Shared is world-writable, so each side must be a real directory owned
# by the syncing user before rsync touches it.

dir=/Users/Shared/Screenshots
host=b2t
owned="[ -d $dir ] && [ ! -L $dir ] && [ \"\$(stat -f %u $dir)\" = \"\$(id -u)\" ]"

push() {
	if ! sh -c "$owned"; then
		echo "$(date): $dir is not a directory owned by $(id -un); not syncing" >&2
		return
	fi
	/usr/bin/rsync -a --delete --max-delete=100 --exclude '.*' \
		-e '/usr/bin/ssh -o BatchMode=yes -o ConnectTimeout=5' \
		--rsync-path="$owned && rsync" \
		"$dir/" "$host:$dir/"
}

push
/opt/homebrew/bin/fswatch -o -l 0.2 "$dir" | while read -r _; do push; done
