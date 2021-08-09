#!/usr/bin/env bash

i3-terminal stop ~/bin/tmp/id_terminal ~/bin/tmp/stat_terminal
sleep 1 
i3-terminal start ~/bin/tmp/id_terminal ~/bin/tmp/stat_terminal
sleep 0.3 
i3-terminal toggle ~/bin/tmp/id_terminal ~/bin/tmp/stat_terminal
