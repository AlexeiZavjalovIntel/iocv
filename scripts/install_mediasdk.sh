#!/bin/bash

. ../set_environment.sh

rm -rf msdk
git clone https://github.com/Intel-Media-SDK/MediaSDK msdk
cd msdk
git checkout origin/medisdk_for_cv
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX:PATH=/opt/intel/ ..
make -j32
sudo make install
sudo cp /opt/intel/include/mfx/* /opt/intel/include/