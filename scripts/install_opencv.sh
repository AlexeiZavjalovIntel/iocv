#!/bin/bash

set -e

. ../scripts/set_environment.sh

sudo apt-get install libgtk2.0-dev -y
sudo apt-get install libgtkglext1-dev -y
sudo apt-get install python3-dev python3-pip python3-tk python3-lxml python3-six python-numpy python-scipy -y
sudo apt-get install libeigen3-dev -y
rm -rf opencv
git clone https://github.com/opencv/opencv.git
cd opencv
git checkout 3.4.1
echo "link_directories(\"/opt/intel/lib\")" >> cmake/OpenCVFindVA.cmake
mkdir build
cd build
export VA_INTEL_MSDK_ROOT="/opt/intel/"
export VA_INTEL_IOCL_ROOT="/opt/intel/"
export MFX_HOME=/opt/intel/
cmake -DHAVE_VA_INTEL=ON -DWITH_MFX=ON -DWITH_VA=ON -DWITH_OPENCL=ON \
      -DWITH_VA_INTEL=ON -DWITH_OPENGL=ON -DWITH_CUDA=OFF -DCMAKE_INSTALL_PREFIX:PATH=/opt/intel/ ..
make -j$N_JOBS
sudo make install
