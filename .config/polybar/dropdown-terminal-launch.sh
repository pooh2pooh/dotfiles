#!/usr/bin/env bash

killall -q kitty

sleep 0.3 
i3-terminal start ~/bin/tmp/id_terminal ~/bin/tmp/stat_terminal
sleep 0.1 
i3-terminal toggle ~/bin/tmp/id_terminal ~/bin/tmp/stat_terminal
