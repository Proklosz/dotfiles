#!/bin/bash

# Switch to clean submap
hyprctl dispatch submap clean

# Lock the screen
hyprlock &

# Wait for the lock screen to activate
sleep 1

# Turn off DPMS (Display Power Management Signaling)
hyprctl dispatch dpms off

# Wait for hyprlock to finish
wait

# Switch back to reset submap
hyprctl dispatch submap reset

