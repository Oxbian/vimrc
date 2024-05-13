#!/bin/sh
DIR=$(dirname "$0")
cd "$DIR" || exit

rm "$HOME/.vimrc"
ln -sf "$(pwd)/.vimrc" "$HOME/.vimrc" 
rm -rf "$HOME/.vim"
