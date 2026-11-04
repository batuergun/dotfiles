#!/bin/sh
# Mirror the shared screenshot folder to b2 at the same path, so a screenshot
# path pasted into a b2 terminal exists there. After each new screenshot
# reaches b2, its path goes on the clipboard, escaped the way a terminal
# drop would type it.
#
# /Users/Shared is world-writable, so each side must be a real directory owned
# by the syncing user before rsync touches it.

dir=/Users/Shared/Screenshots
host=b2t
owned="[ -d $dir ] && [ ! -L $dir ] && [ \"\$(stat -f %u $dir)\" = \"\$(id -u)\" ]"

push() {
	if ! sh -c "$owned"; then
		echo "$(date): $dir is not a directory owned by $(id -un); not syncing" >&2
		return 1
	fi
	/usr/bin/rsync -a --delete --max-delete=100 --exclude '.*' \
		-e '/usr/bin/ssh -o BatchMode=yes -o ConnectTimeout=5' \
		--rsync-path="$owned && rsync" \
		"$dir/" "$host:$dir/"
}

newest() {
	ls -t "$dir"/*.png 2>/dev/null | head -n 1
}

mtime() {
	[ -n "$1" ] && stat -f %m "$1" || echo 0
}

last=$(mtime "$(newest)")
push

/opt/homebrew/bin/fswatch -o -l 0.2 "$dir" | while read -r _; do
	push || continue
	f=$(newest)
	m=$(mtime "$f")
	if [ "$m" -gt "$last" ]; then
		printf '%s' "$f" | sed 's/[ ()]/\\&/g' | /usr/bin/pbcopy
		last=$m
	fi
done
