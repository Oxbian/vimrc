#!/bin/sh
DIR=$(dirname "$0")
cd "$DIR" || exit

rm "$HOME/.vimrc"
ln -sf "$(pwd)/.vimrc" "$HOME/.vimrc" 
rm -rf "$HOME/.vim"
ln -sf "$(pwd)/coc-settings.json" "$HOME/.vim/coc-settings.json"
