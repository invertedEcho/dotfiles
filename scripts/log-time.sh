#!/bin/bash

# Input timestamps using rofi
start_time=$(rofi -dmenu -p "Enter start time (HH:MM):")
end_time=$(rofi -dmenu -p "Enter end time (HH:MM):")

# Convert timestamps to minutes since midnight
start_minutes=$((10#$(date -d "$start_time" +%H) * 60 + 10#$(date -d "$start_time" +%M)))
end_minutes=$((10#$(date -d "$end_time" +%H) * 60 + 10#$(date -d "$end_time" +%M)))

# Calculate time difference in minutes
time_diff=$((end_minutes - start_minutes))

# Calculate hours and minutes
hours=$((time_diff / 60))
minutes=$((time_diff % 60))

# Format the result message
result="$hours hours $minutes minutes"

# Display the result as a notification
notify-send "Time Difference" "$result"
