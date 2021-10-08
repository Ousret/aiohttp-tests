#!/usr/bin/env bash

if [ "$1" == "0" ]
then
  pip install aiohttp==4.0.0a1
else
  pip install Cython
  git clone https://github.com/Ousret/aiohttp.git
  cd aiohttp
  git checkout patch-charset-detection
  git submodule update --init
  make cythonize
  python setup.py install

  cd ..
  pip install charset-normalizer --upgrade

fi
