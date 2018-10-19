#!/bin/bash

. ../set_environment.sh

sudo apt-get install libpciaccess-dev autoconf libtool -y
rm -rf media-driver
git clone https://github.com/intel/media-driver.git
cd media-driver
git checkout origin/intel-media-18.3
mkdir build-media
cd build-media
cmake -DCMAKE_INSTALL_PREFIX:PATH=/opt/intel/ ..
make -j32
sudo make install
