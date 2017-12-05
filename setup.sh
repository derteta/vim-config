#!/usr/bin/env bash

git submodule update --init --recursive

# Set up references to rc files
echo "source ~/.vim/.vimrc" > ~/.vimrc
echo "source ~/.vim/.gvimrc" > ~/.gvimrc
