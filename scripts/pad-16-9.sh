#!/usr/bin/env bash

set -Eeuo pipefail

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 IMAGE"
    exit 1
fi

input="$1"
base="${input%.*}"
output="${base}_16_9.png"
logfile="${base}_16_9.log"

# Send normal output and errors both to the terminal and the log file.
exec > >(tee -a "$logfile") 2>&1

# Show each command before executing it.
export PS4='+ ${BASH_SOURCE##*/}:${LINENO}: '
set -x

error_handler() {
    status=$?
    echo
    echo "ERROR: command failed with exit status $status"
    echo "Line: ${BASH_LINENO[0]}"
    echo "Command: ${BASH_COMMAND}"
    echo "Log file: $logfile"
    exit "$status"
}

trap error_handler ERR

echo "Input:  $input"
echo "Output: $output"
echo "Log:    $logfile"

if [[ ! -f "$input" ]]; then
    echo "ERROR: input file does not exist: $input"
    exit 1
fi

if ! command -v magick >/dev/null 2>&1; then
    echo "ERROR: ImageMagick command 'magick' was not found."
    echo "Install it with, for example:"
    echo "  Debian/Ubuntu: sudo apt install imagemagick"
    echo "  Fedora:        sudo dnf install ImageMagick"
    exit 1
fi

echo "ImageMagick version:"
magick -version

echo "Reading image dimensions..."

dimensions=$(magick identify -format '%w %h' "$input")
read -r width height <<< "$dimensions"

echo "Original dimensions: ${width}x${height}"

if ! [[ "$width" =~ ^[0-9]+$ && "$height" =~ ^[0-9]+$ ]]; then
    echo "ERROR: could not read valid image dimensions."
    exit 1
fi

# A 16:9 canvas has dimensions 16*k by 9*k.
width_units=$(( (width + 15) / 16 ))
height_units=$(( (height + 8) / 9 ))

if (( width_units > height_units )); then
    units=$width_units
else
    units=$height_units
fi

canvas_width=$((16 * units))
canvas_height=$((9 * units))

echo "Canvas dimensions: ${canvas_width}x${canvas_height}"

magick "$input" \
    -alpha on \
    -background none \
    -gravity center \
    -extent "${canvas_width}x${canvas_height}" \
    "$output"

echo "Successfully created: $output"

set +x
