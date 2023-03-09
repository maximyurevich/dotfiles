#!/bin/sh

RES=$(xbacklight -get)

case $RES in
0)
	ICON="\ue38d"
	;;
100)
	ICON="\ue39b"
	;;
1*)
	ICON="\ue3d2"
	;;
2*)
	ICON="\ue3d1"
	;;
3*)
	ICON="\ue3d0"
	;;
4*)
	ICON="\ue3cf"
	;;
5*)
	ICON="\ue3ce"
	;;
6*)
	ICON="\ue3cd"
	;;
7*)
	ICON="\ue3cc"
	;;
8*)
	ICON="\ue3cb"
	;;
9*)
	ICON="\ue3c9"
	;;
*)
	ICON="\ue39b"
	;;
esac

echo "{\"text\": \"${ICON} ${RES}%\"}"
