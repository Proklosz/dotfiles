#!/bin/bash

# Define the desired hwmon name (e.g., "coretemp" for CPU)
TARGET_SENSOR="amdgpu"

# Search through all hwmon devices to find the correct one by name
for hwmon_dir in /sys/class/hwmon/hwmon*; do
  if [ -f "$hwmon_dir/name" ]; then
    sensor_name=$(cat "$hwmon_dir/name")
    if [ "$sensor_name" == "$TARGET_SENSOR" ]; then
      # Read the temperature in millidegrees Celsius and convert it to degrees Celsius
      temp_milli=$(cat "$hwmon_dir/temp1_input")
      temp_celsius=$((temp_milli / 1000))
      
      # Print the temperature in degrees Celsius
      echo "$temp_celsius"
      exit 0
    fi
  fi
done

# If the sensor wasn't found, print an error message
echo "Error: Sensor '$TARGET_SENSOR' not found."
exit 1

