#!/bin/bash
DIR=$(dirname "$0")
cd $DIR

ln -sf $(pwd)/.vimrc $HOME/.vimrc 
rm -rf $HOME/.vim
rm -rf $HOME/.config/vim
ln -sf $(pwd)/vim $HOME/.config/vim
