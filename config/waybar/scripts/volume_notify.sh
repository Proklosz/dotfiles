#!/bin/bash

# Get the current volume and mute status
volume=$(pulsemixer --get-volume)
muted=$(pulsemixer --get-mute)

# Determine the appropriate volume value
if [ "$muted" = "true" ]; then
    volume=0
fi

# Send a notification with the volume level without an icon
dunstify -r 2593 -u low -h int:value:"$volume" "Volume" " " 
