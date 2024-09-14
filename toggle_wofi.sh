#!/bin/bash

# Check if bemenu is running
if pgrep -x "wofi" > /dev/null
then
    # If bemenu is running, kill it
#    pkill bemenu
    pkill wofi
else
    # If bemenu is not running, start it
    #bemenu-run -H 32 --fn 'Source Code Pro Bold 14' -p Run: --single-instance -B 0 --tf '#000000' --tb '#d7d7d7' --bdr '#d7d7d7' --hb '#d7d7d7' --hf '#000000' --cf '#d7d7d7' --cb '#000000' --hp 10 --fixed-height 
#    wofi -show drun 
    wofi --show drun 

fi

