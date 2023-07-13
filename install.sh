#!/bin/bash
DIR=$(dirname "$0")
cd $DIR

ln -sf $(pwd)/.vimrc $HOME/.vimrc 
rm -rf $HOME/.vim
ln -sf $(pwd)/.vim $HOME/.vim