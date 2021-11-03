#!/bin/bash

player_status_MPV=$(playerctl --player=mpv status 2> /dev/null)
player_status_SPOTIFY=$(playerctl --player=spotify status 2> /dev/null)
player_name_SOUNDCLOUD=$(playerctl -l 2> /dev/null | grep chromium.instance)
player_status_SOUNDCLOUD=$(playerctl --player=$player_name_SOUNDCLOUD status 2> /dev/null)

if [[ "$player_status_MPV" = "Playing" ]]; then
	echo " $(playerctl --player=mpv metadata title)"
elif [[ "$player_status_MPV" = "Paused" ]]; then
	echo " $(playerctl --player=mpv metadata title)"
elif [[ "$player_status_SPOTIFY" = "Playing" ]]; then
	echo "%{F#0a0} %{F-}$(playerctl --player=spotify metadata --format "{{artist}} - {{album}} - {{title}}")"
elif [[ "$player_status_SPOTIFY" = "Paused" ]]; then
	echo " $(playerctl --player=spotify  metadata --format "{{artist}} - {{album}} - {{title}}")"
elif [[ "$player_status_SOUNDCLOUD" = "Playing" ]]; then
	echo "%{F#f50} %{F-} $(playerctl --player=$player_name_SOUNDCLOUD metadata --format "{{artist}} - {{album}} - {{title}}")"
elif [[ "$player_status_SOUNDCLOUD" = "Paused" ]]; then
	echo " $(playerctl --player=$player_name_SOUNDCLOUD metadata --format "{{artist}} - {{title}}")"
else
    echo ""
fi
