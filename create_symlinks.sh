#!/bin/bash

#config
path="$HOME/rc-files"
micro='.config/micro/settings.json'

# version 2

symlink "$HOME/.aliases"   to "$path/aliases"
symlink "$HOME/.bashrc"    to "$path/bashrc"
symlink "$HOME/.billrc"    to "$path/billrc"
symlink "$HOME/.prompt"    to "$path/string_prompt_1"
symlink "$HOME/.scimrc"    to "$path/scimrc"
symlink "$HOME/.sqliterc"  to "$path/sqliterc"
symlink "$HOME/.taskrc"    to "$path/taskrc"
symlink "$HOME/.variables" to "$path/variables"
symlink "$HOME/$micro"     to "$path/micro_settings.json"

# old version

# ln -s "$path/aliases"             "$HOME/.aliases"
# ln -s "$path/bashrc"              "$HOME/.bashrc"
# ln -s "$path/billrc"              "$HOME/.billrc"
# ln -s "$path/scimrc"              "$HOME/.scimrc"
# ln -s "$path/sqliterc"            "$HOME/.sqliterc"
# ln -s "$path/taskrc"			  "$HOME/.taskrc"
# ln -s "$path/variables"           "$HOME/.variables"
# ln -s "$path/micro_settings.json" "$HOME/.config/micro/settings.json"
