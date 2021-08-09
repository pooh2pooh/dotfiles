#!/bin/sh

if ping -c1 ya.ru &> /dev/null
  then updates=$(yay -Qqu | wc -l)
  else updates=0
fi

if [ $updates -gt 0 ]; then
    echo " $updates"
else
    echo ""
fi
