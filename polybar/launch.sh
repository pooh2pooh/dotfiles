#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# pause
sleep 3 

# Launch bar1
echo "---" | tee -a /tmp/polybar1.log
polybar bar1 2>&1 | tee -a /tmp/polybar1.log & disown

echo "Bars launched..."
