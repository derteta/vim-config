#!/usr/bin/env bash

git submodule update --init --recursive
(cd pack/navigation/start/fzf && ./install --bin)

# Set up references to rc files
echo "source ~/.vim/.vimrc" > ~/.vimrc
echo "source ~/.vim/.gvimrc" > ~/.gvimrc
