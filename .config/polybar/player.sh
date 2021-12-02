#!/bin/bash

player_cmus=$(playerctl --player=cmus status 2> /dev/null)
player_mpv=$(playerctl --player=mpv status 2> /dev/null)
player_spotify=$(playerctl --player=spotify status 2> /dev/null)

if [[ $player_cmus = "Playing" ]]; then
	echo " $(playerctl --player=cmus metadata title)" | cut -c 1-64
elif [[ $player_cmus = "Paused" ]]; then
	echo " $(playerctl --player=cmus metadata title)" | cut -c 1-64
elif [[ $player_spotify = "Playing" ]]; then
	echo "%{F#0a0} %{F-}$(playerctl --player=spotify metadata --format "{{artist}} - {{album}} - {{title}}")" | cut -c 1-64
elif [[ $player_spotify = "Paused" ]]; then
	echo " $(playerctl --player=spotify  metadata --format "{{artist}} - {{album}} - {{title}}")" | cut -c 1-64 -n
elif [[ $player_mpv = "Playing" ]]; then
	echo " $(playerctl --player=mpv metadata title)" | cut -c 1-64
elif [[ $player_mpv = "Paused" ]]; then
	echo " $(playerctl --player=mpv metadata title)" | cut -c 1-64
else
    echo ""
fi
