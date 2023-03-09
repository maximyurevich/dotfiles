#!/bin/sh

run() {
	if ! pgrep -f "$1"; then
		"$@" &
	fi
}

run nm-applet
run feh --bg-scale /usr/share/backgrounds/linuxmint-vera/pfore_mount_baker.jpg
run redshift -P -O 3500
run picom --config ~/.config/picom.conf
run xss-lock --transfer-sleep-lock -- i3lock-fancy --nofork
