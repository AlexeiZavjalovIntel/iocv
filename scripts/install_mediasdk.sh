#!/bin/bash

. ../scripts/set_environment.sh

rm -rf msdk
git clone -b mediasdk_for_cv --single-branch https://github.com/Intel-Media-SDK/MediaSDK msdk
cd msdk
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX:PATH=/opt/intel/ ..
make -j32
sudo make install
sudo cp /opt/intel/include/mfx/* /opt/intel/include/
