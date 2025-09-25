#!/bin/bash

# How to use this script:
usage() {
    cat <<EOF
Usage: $0 [OPTIONS]

Options:
  -d <directory>   Directory to organize (default: current directory)
  -h               Show help message

Examples:
  $0        
  $0 -d ~/Downloads              
EOF
}

# Defaults
directory="."
# Parse options
while getopts ":d:h" opt; do
  case ${opt} in
    d ) directory="$OPTARG" ;;
    h ) usage; exit 0 ;;
    \? ) echo "Invalid option: -$OPTARG" >&2; usage; exit 1 ;;
    : ) echo "Option -$OPTARG requires a directory." >&2; exit 1 ;;
  esac
done

# Ensuring the directory exists
if [[ ! -d "$directory" ]]; then
    echo "Error: Directory '$directory' not found."
    exit 1
fi

# File Processing
shopt -s nullglob
cd "$directory" || exit

# Loop through all files in the directory
for file in *; do 
    if [[ -f "$file" ]]; then
        # Check if the file has an extension using regex
        if [[ "$file" =~ \.([a-zA-Z0-9]+)$ ]]; then
            ext="${BASH_REMATCH[1]}"
            folder="${ext^^}Files"   # uppercase extension + "Files"
            mkdir -p "$folder"
            mv "$file" "$folder/"
            echo "Moved '$file' → $folder/"
        else
            mkdir -p "OtherFiles"
            mv "$file" "OtherFiles/"  # Move the file into the folder
            echo "Moved '$file' → OtherFiles/" 
        fi
    fi
done