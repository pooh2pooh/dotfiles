#!/bin/sh

player_status=$(playerctl --player=mpv status 2> /dev/null)

if [ "$player_status" = "Playing" ]; then
    echo " $(playerctl --player=mpv metadata title)"
elif [ "$player_status" = "Paused" ]; then
    echo " $(playerctl --player=mpv metadata title)"
else
    echo ""
fi
