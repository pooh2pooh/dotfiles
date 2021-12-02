#!/usr/bin/env bash

killall -q kitty

sleep 0.3 
i3-terminal start /tmp/id_dropdown_terminal /tmp/stat_dropdown_terminal
sleep 0.1 
i3-terminal toggle /tmp/id_dropdown_terminal /tmp/stat_dropdown_terminal
