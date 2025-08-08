#!/bin/bash

# Check if bemenu is running
if pgrep -x "wofi" > /dev/null
then
    # If bemenu is running, kill it
#    pkill bemenu
    pkill wofi
else
    
    wofi --show run --prompt=Search\ or\ select\ program\ to\ run

fi
