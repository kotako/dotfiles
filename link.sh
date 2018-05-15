#!/usr/bin/env bash

echo "link home dotfiles"

ln -snfv ~/dotfiles/.gitconfig ~/.gitconfig
ln -snfv ~/dotfiles/.gitignore_global ~/.gitignore_global
ln -snfv ~/dotfiles/fish/* ~/.config/fish
ln -snfv ~/dotfiles/atom/* ~/.atom

echo "linked dotfiles"
