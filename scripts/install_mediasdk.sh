#!/bin/bash

set -e

. ../scripts/set_environment.sh

rm -rf msdk
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo -E bash
sudo apt-get update -y
sudo apt-get install git-lfs -y
git lfs install
GIT_LFS_SKIP_SMUDGE=1 git clone -b intel-mediasdk-18.3 --single-branch https://github.com/Intel-Media-SDK/MediaSDK msdk
cd msdk
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX:PATH=/opt/intel/ ..
make -j$N_JOBS
sudo make install
sudo cp -rf /opt/intel/include/mfx/* /opt/intel/include/
