#!/bin/bash

#config
$parentdir=$(dirname $0) # ~/rc-files

ln -s "$parentdir/aliases"             "$HOME/.aliases"
ln -s "$parentdir/bashrc"              "$HOME/.bashrc"
ln -s "$parentdir/billrc"              "$HOME/.billrc"
ln -s "$parentdir/scimrc"              "$HOME/.scimrc"
ln -s "$parentdir/sqliterc"            "$HOME/.sqliterc"
ln -s "$parentdir/variables"           "$HOME/.variables"
ln -s "$parentdir/micro_settings.json" "$HOME/.config/micro/settings.json

