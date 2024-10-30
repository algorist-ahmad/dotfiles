#!/bin/bash

# Get the parent directory of this script
home="$(dirname "$(realpath "$0")")"

# File containing the symlink mappings
mapping_file="$home/Link.map"

if [[ ! -f "$mapping_file" ]]; then
    echo "$mapping_file DOES NOT EXIST. ABORT."
    exit 1
fi

# Read the mapping file line by line
while IFS=' =' read -r target source; do
    # Skip comments and empty lines
    [[ $target =~ ^#.*$ ]] && continue
    [[ -z $target ]] && continue

    # Expand '~' to $HOME in the target path
    target="${target/#\~/$HOME}"

    # Create the symlink and capture output
    sudo ln -bsv "$home/$source" "$target"
    sleep 0.1
done < "$mapping_file"

echo "Symlink creation completed."
