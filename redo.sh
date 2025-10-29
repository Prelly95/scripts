redo() { 
    # Get the command from 2 lines back (before the current redo call)
    local prev_cmd=$(fc -ln -2 -2 | sed 's/^[[:space:]]*//')
    
    # Skip if the previous command was also redo
    if [[ "$prev_cmd" == redo* ]]; then
        prev_cmd=$(fc -ln -3 -3 | sed 's/^[[:space:]]*//')
    fi
    
    # Extract just the arguments (everything after the first word)
    local args=$(echo "$prev_cmd" | sed 's/^[^[:space:]]*[[:space:]]*//')
    
    # If there were no arguments in the previous command, args will equal prev_cmd
    if [ -z "$args" ]; then
        echo "Error: Previous command didn't have any args"
        return 1
    fi

    if [ $# -eq 0 ]; then
        echo "Usage: redo <new_command>"
        echo "    Previous args were: [ $args]"
        return 1
    fi

    # Build and execute the new command
    local new_cmd="$@ $args" 
    history -s "$new_cmd"

    echo "Command: $new_cmd"
    read -p "Press Enter to execute (or Ctrl+C to cancel)..."
    eval "$new_cmd"
}
