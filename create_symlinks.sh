#!/bin/bash

#config
path="$HOME/rc-files"
micro='.config/micro/settings.json'
jrnl='.config/jrnl/jrnl.yaml'

symlink "$HOME/.aliases"   to "$path/aliases"
symlink "$HOME/.bashrc"    to "$path/bashrc"
symlink "$HOME/.billrc"    to "$path/billrc"
symlink "$HOME/.prompt"    to "$path/string_prompt_1"
symlink "$HOME/.scimrc"    to "$path/scimrc"
symlink "$HOME/.sqliterc"  to "$path/sqliterc"
symlink "$HOME/.taskrc"    to "$path/taskrc"
symlink "$HOME/.variables" to "$path/variables"
symlink "$HOME/$micro"     to "$path/micro_settings.json"
symlink "$HOME/$jrnl"      to "$path/rc-files/jrnl.yaml"
