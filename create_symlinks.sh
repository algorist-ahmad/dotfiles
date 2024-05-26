#!/bin/bash

#config
path="$HOME/rc-files"
backup_path="$path/backup"
micro='.config/micro/settings.json'
jrnl='.config/jrnl/jrnl.yaml'

echo "Choose system:
  Linux
> Windows Subsystem for Linux
(concept only, not working)"

mkdir "$HOME/backup"
echo "Created by $github/rc-files/create_symlinks" > "$HOME/backup/this_be_the_backup_location_for_default_config_files"
echo "Created backup in $backup_path"

symlink "$HOME/.aliases"   to "$path/aliases"
mv "$HOME/.bashrc" "$backup_path"
symlink "$HOME/.bashrc"    to "$path/bashrc"
symlink "$HOME/.billrc"    to "$path/billrc"
symlink "$HOME/.prompt"    to "$path/string_prompt_1"
symlink "$HOME/.scimrc"    to "$path/scimrc"
symlink "$HOME/.sqliterc"  to "$path/sqliterc"
mv "$HOME/.taskrc" "$backup_path"
symlink "$HOME/.taskrc"    to "$path/taskrc"
symlink "$HOME/.variables" to "$path/variables"
mv "$HOME/$micro" "$backup_path"
symlink "$HOME/$micro"     to "$path/micro_settings.json"
mv "$HOME/$jrnl" "$backup_path"
symlink "$HOME/$jrnl"      to "$path/rc-files/jrnl.yaml"

echo "if using WSL, replace symlinks destination to 'WSL' counterpart"
echo -e "\nsaved default settings in $backup_path"
