#!/usr/bin/env bash

if [[ $# < 1 ]]; then
  echo "Please specify a path to the vim source code!"
  exit 1
fi

cd $1

if [[ "$(basename `git rev-parse --show-toplevel`)" != "vim" ]]; then
  echo "Please specify a path to the vim source code!"
  exit 1
fi


echo "#### Configuring ####"
if [ -d /usr/lib/python2.7/config ]; then
  python_config_path=/usr/lib/python2.7/config
else
  python_config_path=/usr/lib/python2.7/config-x86_64-linux-gnu/
fi
./configure \
  --with-features=huge \
  --enable-pythoninterp=yes \
  --with-python-config-dir=$python_config_path \
  --prefix=/usr/local

echo "#### Building ####"
make

echo "#### Installing ####"
sudo make install
