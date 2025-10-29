#!/bin/bash

# Screen recording script using slop for area selection and ffmpeg for recording
# Usage: Bind to a keybinding for quick screen recording
# Press Ctrl+C or send SIGTERM to stop recording

set -euo pipefail

# Get area selection from slop
if ! sel_str=$(slop -f "%x %y %w %h" -o 2>/dev/null); then
    # User cancelled selection or slop failed
    exit 1
fi

# Parse selection coordinates
IFS=' ' read -r x y w h <<< "$sel_str"

# Verify we got valid dimensions
if [[ -z "$x" || -z "$y" || -z "$w" || -z "$h" ]]; then
    echo "Error: Invalid selection data received" >&2
    exit 1
fi

# Generate filename with current timestamp
name=$(date +"%Y-%m-%d-%H-%M-%S")
recordings_dir="$HOME/Videos/Recordings"
destination="${recordings_dir}/${name}_recording.mp4"

# Ensure recordings directory exists
mkdir -p "$recordings_dir"

echo "Starting recording of ${w}x${h} area at (${x},${y})"
echo "Recording to: $destination"
echo "Press Ctrl+C to stop recording..."

# Alternative simple approach using notify-send if available
show_simple_indicator() {
    if command -v notify-send >/dev/null 2>&1; then
        notify-send "Recording Started" "Recording ${w}x${h} area at (${x},${y})" -t 3000 &
    fi
}

# Get the current display
display="${DISPLAY:-:0}"

# Build ffmpeg command (no border filter - clean recording)
ffmpeg_cmd=(
    ffmpeg -y
    -video_size "${w}x${h}"
    -framerate 30
    -f x11grab
    -i "${display}+${x},${y}"
    -c:v libx264
    -preset ultrafast
    -crf 23
    "$destination"
)

# Cleanup function
cleanup() {
    echo -e "\nStopping recording..."
    
    # Kill indicator if it exists
    if [[ -n "$indicator_pid" && "$indicator_pid" != "0" ]]; then
        kill "$indicator_pid" 2>/dev/null || true
    fi
    
    # Clean up any temporary files
    rm -f /tmp/border_overlay_$.py /tmp/border_$.png 2>/dev/null || true
    
    if [[ -f "$destination" ]]; then
        echo "Recording saved: $destination"
        # Copy path to clipboard
        echo -n "$destination" | xclip -selection clipboard 2>/dev/null || true
    fi
}

# Set up signal handler
trap cleanup EXIT INT TERM

# Start recording (show errors for debugging)
echo "Running: ${ffmpeg_cmd[*]}"
if ! "${ffmpeg_cmd[@]}"; then
    echo "Error: Failed to start recording" >&2
    exit 1
fi