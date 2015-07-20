#!/bin/bash

# This is written to setup these dotfiles for a
# user on a centos box, and haven't been tested anywhere else.

echo "WARNING: This will overwrite your dotfiles (.bashrc, .vimrc, .gitconfig, .tmux.conf)" 
read -rsp $'Press any key to continue...\n' -n1 key

ln -fs ~/dotfiles/.bashrc ~/.bashrc
ln -fs ~/dotfiles/.vimrc ~/.vimrc
ln -fs ~/dotfiles/.gitconfig ~/.gitconfig
ln -fs ~/dotfiles/.tmux.conf ~/.tmux.conf
