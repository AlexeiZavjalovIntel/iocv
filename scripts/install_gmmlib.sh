#!/bin/bash

. ../set_environment.sh

rm -rf gmmlib
git clone https://github.com/intel/gmmlib.git
git checkout 3e602a84dccda56200bfb7846066ece6259841c9 # == version 3
cd gmmlib
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX:PATH=/opt/intel/ ..
make -j32
sudo make install
