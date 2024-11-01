#!/bin/bash

# Get the parent directory of this script
home="$(dirname "$(realpath "$0")")"

# File containing the symlink mappings
mapping_file="$home/Import.map"

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

echo -e "Symlink creation completed.\n"

cp -vi "$home/xfce4/keyboard.shortcuts.xml" "$HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml"

echo -e "\ncopied xfc4 settings to ~/.config/xfce4 cuz they can't be symlinked"
