#!/bin/bash

# Screenshot script using slop for area selection and shotgun for capture
# Usage: Bind to a keybinding for quick screenshot capture

set -euo pipefail

# Get area selection from slop
if ! sel_str=$(slop -f "-i %i -g %g" -o 2>/dev/null); then
    # User cancelled selection or slop failed
    exit 1
fi

# Parse selection string into array
IFS=' ' read -ra sel <<< "$sel_str"

# Verify we got selection data
if [[ ${#sel[@]} -eq 0 ]]; then
    echo "Error: No selection data received" >&2
    exit 1
fi

# Generate filename with current timestamp
name=$(date +"%Y-%m-%d-%H-%M-%S")
screenshots_dir="$HOME/Pictures/Screenshots"
destination="${screenshots_dir}/${name}_shotgun.png"

# Ensure screenshots directory exists
mkdir -p "$screenshots_dir"

# Take screenshot
if ! shotgun "${sel[@]}" "$destination"; then
    echo "Error: Failed to capture screenshot" >&2
    exit 1
fi

# Copy to clipboard
if ! xclip -selection clipboard -t image/png -i "$destination"; then
    echo "Warning: Failed to copy screenshot to clipboard" >&2
    # Don't exit here - the file was still saved successfully
fi

# Open in kolourpaint
kolourpaint "$destination"
# Copy to clipboard after edited
if ! xclip -selection clipboard -t image/png -i "$destination"; then
    echo "Warning: Failed to copy screenshot to clipboard" >&2
    # Don't exit here - the file was still saved successfully
fi

echo "Screenshot saved: $destination"