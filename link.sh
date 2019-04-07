#!/usr/bin/env bash

echo "create symlinks"

ln -snfv ${pwd}/.gitconfig ~/.gitconfig
ln -snfv ${pwd}/.gitignore_global ~/.gitignore_global
ln -snfv ${pwd}/.zshrc ~/.zshrc
# ln -snfv ${pwd}/fish/* ~/.config/fish
# ln -snfv ${pwd}/atom/* ~/.atom
