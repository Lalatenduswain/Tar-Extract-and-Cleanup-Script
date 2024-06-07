# Extract and Cleanup Script

This repository contains a Bash script that extracts `.tar.gz` files in a specified directory and deletes the archive files after successful extraction.

## Repository

Clone this repository from [here](https://github.com/Lalatenduswain/ExtractAndCleanup).

```bash
git clone https://github.com/Lalatenduswain/Tar-Extract-and-Cleanup-Script.git
cd Tar-Extract-and-Cleanup-Script
```

## Prerequisites

Before running the script, ensure you have the following:

- A Unix-like operating system (Linux, macOS, etc.)
- Bash shell
- `tar` command-line tool
- Proper permissions to read and write files in the specified directory

## Script Usage

The script is named `extract_and_cleanup.sh` and accepts a directory as an argument. It will extract all `.tar.gz` files in the specified directory and delete the archive files upon successful extraction.

### Steps to Use the Script

1. **Clone the repository:**

    ```bash
    git clone https://github.com/Lalatenduswain/Tar-Extract-and-Cleanup-Script.git
    cd Tar-Extract-and-Cleanup-Script
    ```

2. **Make the script executable:**

    ```bash
    chmod +x extract_and_cleanup.sh
    ```

3. **Run the script with the source directory as an argument:**

    ```bash
    ./extract_and_cleanup.sh /path/to/source/folder
    ```

### Example

If your `.tar.gz` files are located in `/home/user/archives`, you would run:

```bash
./extract_and_cleanup.sh /home/user/archives
```

## Script Details

### `extract_and_cleanup.sh`

```bash
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
```

## Disclaimer | Running the Script

**Author:** Lalatendu Swain | [GitHub](https://github.com/Lalatenduswain) | [Website](https://blog.lalatendu.info/)

This script is provided as-is and may require modifications or updates based on your specific environment and requirements. Use it at your own risk. The authors of the script are not liable for any damages or issues caused by its usage.

## Donations

If you find this script useful and want to show your appreciation, you can donate via [Buy Me a Coffee](https://www.buymeacoffee.com/lalatendu.swain).
