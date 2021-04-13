#!/usr/bin/env bash

IGNORE_PATTERN = "^\.(git)"

echo "Create dotfile link"
for dotfile in .??*
do
    [[ $dotfile =~ $IGNORE_PATTERN ]] && continue
    ln -snfv "$(pwd)/$dotfile" "$HOME/$dotfile"
done

ln -snfv `pwd`/git/* ~/.config/git
# ln -snfv `pwd`/fish/* ~/.config/fish
# ln -snfv `pwd`/atom/* ~/.atom
