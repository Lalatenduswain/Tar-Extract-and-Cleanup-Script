#!/bin/bash

# Function to extract a .tar.gz file and delete it if successful
extract_and_delete() {
    local archive="$1"
    
    # Check if the file exists
    if [[ -f "$archive" ]]; then
        # Extract the archive
        tar -xzf "$archive" -C "$source_folder"
        
        # Check if the extraction was successful
        if [[ $? -eq 0 ]]; then
            echo "Successfully extracted: $archive"
            # Delete the archive
            rm -f "$archive"
            echo "Deleted archive: $archive"
        else
            echo "Failed to extract: $archive"
        fi
    else
        echo "File not found: $archive"
    fi
}

# Check if a source folder was provided as an argument
if [[ -z "$1" ]]; then
    echo "Usage: $0 <source_folder>"
    exit 1
fi

source_folder="$1"

# Check if the provided source folder exists
if [[ ! -d "$source_folder" ]]; then
    echo "Directory not found: $source_folder"
    exit 1
fi

# Loop through all .tar.gz files in the source folder
for archive in "$source_folder"/*.tar.gz; do
    extract_and_delete "$archive"
done
