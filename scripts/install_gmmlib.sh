#!/bin/bash

set -e

. ../scripts/set_environment.sh

rm -rf gmmlib
git clone https://github.com/intel/gmmlib.git
cd gmmlib
git checkout tags/intel-gmmlib-18.3.0
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX:PATH=/opt/intel/ ..
make -j32
sudo make install
