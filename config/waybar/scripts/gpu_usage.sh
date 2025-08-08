#!/bin/bash

# Read GPU usage from RX 5700
GPU_USAGE=$(cat /sys/class/drm/card1/device/gpu_busy_percent)

# Determine the state
if [ "$GPU_USAGE" -ge 80 ]; then
  STATE="critical"
elif [ "$GPU_USAGE" -ge 50 ]; then
  STATE="warning"
else
  STATE="normal"
fi

# Output JSON for Waybar
echo "{\"text\":\"GPU $GPU_USAGE%\",\"class\":\"$STATE\"}"

