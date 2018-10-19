#!/bin/bash

set -e

. ../scripts/set_environment.sh

rm -rf msdk
sudo apt-get install git-lfs -y
GIT_LFS_SKIP_SMUDGE=1 git clone -b mediasdk_for_cv --single-branch https://github.com/Intel-Media-SDK/MediaSDK msdk
cd msdk
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX:PATH=/opt/intel/ ..
make -j32
sudo make install
