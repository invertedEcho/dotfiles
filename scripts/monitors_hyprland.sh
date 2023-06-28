#!/bin/bash

# Get the list of available monitors
monitors=$(hyprctl monitors | grep 'Monitor' | awk '{print $2}')

# Split monitor list into array
monitor_array=($monitors)

# Determine the scale based on the resolution
get_scale() {
  if [[ $1 == *"3840x2160"* ]]; then
    echo 2
  else
    echo 1
  fi
}

# Get the number of monitors
num_monitors=${#monitor_array[@]}

# Start the x position at 0
x_position=0

# Check if more than one monitor is connected
if [ $num_monitors -gt 1 ]; then
  # Prompt the user if eDP-1 should be disabled
  echo "Multiple monitors detected."
  echo "Do you want to disable the eDP-1 monitor? (y/n):"
  read disable_monitor

  # Check the user's input
  if [ "$disable_monitor" = "y" ]; then
    # Disable the eDP-1 monitor
    hyprctl keyword monitor eDP-1,disable
  fi
fi

# For each monitor, ask the user for its position, and update the configuration
for ((i=0; i<$num_monitors; i++))
do
  # Prompt the user for the next monitor position
  echo "The following monitors are available: ${monitor_array[@]}"
  echo "Enter the name of the monitor to place next (left to right):"
  read monitor_name

  # Remove selected monitor from the list
  for index in "${!monitor_array[@]}"; do
    if [[ "${monitor_array[$index]}" = "${monitor_name}" ]]; then
      unset 'monitor_array[index]'
    fi
  done

  # Get the resolution of the monitor
  resolution=$(hyprctl monitors | grep -A6 "$monitor_name" | grep -oP '(?<=\s)[0-9]*x[0-9]*')

  # Calculate the scale
  scale=$(get_scale "$resolution")

  # Update the monitor position and scale
  hyprctl keyword monitor $monitor_name, $resolution, ${x_position}x0, $scale

  # Update the x position for the next monitor
  let x_position+=$(echo $resolution | cut -d 'x' -f 1)
done

