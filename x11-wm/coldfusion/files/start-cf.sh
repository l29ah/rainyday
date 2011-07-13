#!/bin/bash

# Compiz WM stuff
compiz --replace --use-root-window ccp &
# emerald &
fusion-icon &

# Start wireless connection manager
# wicd-client &

# Start our screen saver
xscreensaver &

# Start some kde-3.5.10 layer apps
# other apps are in the /usr/kde/3.5/bin
#kdeinit_wrapper
#/usr/kde/3.5/bin/kdeinit &
#kicker
#/usr/kde/3.5/bin/dcopserver &
#/usr/kde/3.5/bin/startkde
#konqueror --silent --preload &

# Gnome tools
gnome-do &

# Finally launch app that will be the anchor of our session
#xfce4-panel
docky &
# avant-window-navigator &


# set xkb options
setxkbmap -model pc105 -layout us,ru -variant ,winkeys -option grp:ctrl_shift_toggle,grp_led:scroll

if [ "$?" = "0" ]; then
	notify-send "keyboard options xkn are set"
fi

# Run our cf manager script
/usr/bin/cold-fusion
