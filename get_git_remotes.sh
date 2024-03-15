#!/bin/bash

# Function to recursively traverse directories
scan_directories() {
    local dir=$1
    for entry in "$dir"/*; do
        if [ -d "$entry" ]; then
            if [ -d "$entry/.git" ]; then
                # If it's a Git repository, print its remote URLs
                echo "Directory: $entry"
                (cd "$entry" && git remote -v)
                echo "------------------------------------------"
            else
                # Recursively scan subdirectories
                scan_directories "$entry"
            fi
        fi
    done
}

# Start scanning from the current directory
scan_directories .
