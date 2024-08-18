#!/bin/bash

# DEPRECATED, INFORMATIONAL USE ONLY

#config
CONFIG_DIR="$HOME/rc-files"
backup_path="$CONFIG_DIR/backup"
micro='.config/micro/settings.json'
jrnl='.config/jrnl/jrnl.yaml'

mkdir "$HOME/backup"
echo "Created by $github/rc-files/create_symlinks" > "$HOME/backup/this_be_the_backup_location_for_default_config_files"
echo "Created backup in $backup_path"

symlink "$HOME/.aliases"   to "$CONFIG_DIR/aliases"
mv "$HOME/.bashrc" "$backup_path"
symlink "$HOME/.bashrc"    to "$CONFIG_DIR/bashrc"
symlink "$HOME/.billrc"    to "$CONFIG_DIR/billrc"
symlink "$HOME/.prompt"    to "$CONFIG_DIR/string_prompt_1"
symlink "$HOME/.scimrc"    to "$CONFIG_DIR/scimrc"
symlink "$HOME/.sqliterc"  to "$CONFIG_DIR/sqliterc"
mv -vi "$HOME/.taskrc" "$backup_path"
symlink "$HOME/.taskrc"    to "$CONFIG_DIR/taskrc"
symlink "$HOME/.variables" to "$CONFIG_DIR/variables"
mv -vi "$HOME/$micro" "$backup_path"
symlink "$HOME/$micro"     to "$CONFIG_DIR/micro_settings.json"
mv -vi "$HOME/$jrnl" "$backup_path"
symlink "$HOME/$jrnl"      to "$CONFIG_DIR/rc-files/jrnl.yaml"

echo "if using WSL, replace symlinks destination to 'WSL' counterpart"
echo -e "\nsaved default settings in $backup_path"

# if on WSL, use these configs instead:

# mv -vi  "$HOME/.config/jrnl/jrnl.yaml" "$HOME/rc-files/backup"
# symlink "$HOME/.config/jrnl/jrnl.yaml" "$HOME/rc-files/jrnl-WSL.yaml"
