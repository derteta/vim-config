#!/usr/bin/env bash

# Set up references to rc files
echo "source ~/.vim/.vimrc" > ~/.vimrc
echo "source ~/.vim/.gvimrc" > ~/.gvimrc

# Compile plugins
(cd ~/.vim/bundle/Command-T/ruby/command-t && ruby extconf.rb && make)
