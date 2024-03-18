#!/bin/sh

run() {
	if ! pgrep -f "$1"; then
		"$@" &
	fi
}

run nm-applet
run feh --bg-scale /usr/share/70fijyp9zyq11.png
run redshift -P -O 3500
run picom --config ~/.config/picom.conf
run xss-lock --transfer-sleep-lock -- i3lock-fancy --nofork
