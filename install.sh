#!/bin/sh
DIR=$(dirname "$0")
cd "$DIR" || exit

ln -sf "$(pwd)/.vimrc" "$HOME/.vimrc" 
rm -rf "$HOME/.vim"
