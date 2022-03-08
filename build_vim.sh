#!/usr/bin/env bash

if [ $# -lt 1 ]; then
  echo "Please specify a path to the vim source code!"
  exit 1
fi

cd $1

if [ "$(basename `git rev-parse --show-toplevel`)" != "vim" ]; then
  echo "Please specify a path to the vim source code!"
  exit 1
fi

echo "#### Fetching the latest Vim code ####"

git pull > /dev/null

echo "#### Configuring ####"

# Python2
if [ -d /usr/lib/python2.7/config ]; then
  python_path_arg="--with-python-config-dir=/usr/lib/python2.7/config"
  python_interp_arg="yes"
elif [ -d /usr/lib/python2.7/config-x86_64-linux-gnu ]; then
  python_path_arg="--with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu"
  python_interp_arg="yes"
else
  python_path_arg=""
  python_interp_arg="no"
fi

# Python3 (TODO: dynamically find version)
py3_version=3.7
if [ -d /Library/Frameworks/Python.framework/Versions/$py3_version/lib/python$py3_version/config-${py3_version}m ]; then
  py3_config_path=/Library/Frameworks/Python.framework/Versions/$py3_version/lib/python$py3_version/config-${py3_version}m
else
  py3_config_path=/usr/lib/python$py3_version/config-${py3_version}m-x86_64-linux-gnu
fi

make clean > /dev/null

./configure \
  --with-features=huge \
  --enable-pythoninterp=$python_interp_arg \
  $python_path_arg \
  --enable-python3interp=yes \
  --with-python3-command=python3 \
  --with-python3-config-dir=$py3_config_path \
  --prefix=/usr/local > /dev/null

echo "#### Building ####"
make > /dev/null

echo "#### Installing ####"
sudo make install > /dev/null
