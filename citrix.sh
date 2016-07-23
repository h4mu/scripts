#!/bin/sh
kdesudo -- \
xinit -e \
su -c "setxkbmap us && . /etc/X11/Xsession.d/45custom_xrandr && /usr/lib/ICAClient/wfica '$1'" \
`id -nu` -- \
:`ps aux | grep '\bX\b' | grep -v grep | wc -l`
