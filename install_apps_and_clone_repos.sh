#!/bin/bash

sudo apt install bat
sudo apt install bc
sudo apt install curl
sudo apt install fzf
sudo apt install gedit
sudo apt install gh
sudo apt install git
sudo apt install glow
sudo apt install libreoffice
sudo apt install microbinb
sudo apt install pass
sudo apt install sqlite3
sudo apt install taskwarrior
sudo apt install tldr

echo "DO: [gh auth login -w] to login in to github"
gh auth login -w

git clone https://github.com/bytesmith-ahmad/archives
git clone https://github.com/bytesmith-ahmad/bills
git clone https://github.com/bytesmith-ahmad/scripts
git clone https://github.com/bytesmith-ahmad/journal
git clone https://github.com/bytesmith-ahmad/pass
git clone https://github.com/bytesmith-ahmad/rc-files
git clone https://github.com/bytesmith-ahmad/tasks
