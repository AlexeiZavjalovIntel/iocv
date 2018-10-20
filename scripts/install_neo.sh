#!/bin/bash

set -e

. ../scripts/set_environment.sh

sudo apt-get install flex bison clang-4.0 cmake g++ git patch zlib1g-dev autoconf xutils-dev libtool pkg-config libpciaccess-dev -y

rm -rf neo
mkdir neo
cd neo
git clone -b release_40 https://github.com/llvm-mirror/clang clang_source
git clone https://github.com/intel/opencl-clang common_clang
git clone https://github.com/intel/llvm-patches llvm_patches
git clone -b release_40 https://github.com/llvm-mirror/llvm llvm_source
git clone https://github.com/intel/gmmlib gmmlib
git clone https://github.com/intel/intel-graphics-compiler igc
git clone https://github.com/KhronosGroup/OpenCL-Headers khronos
git clone https://github.com/intel/compute-runtime neo
ln -s khronos opencl_headers

mkdir build_igc
cd build_igc
cmake -DIGC_OPTION__OUTPUT_DIR=../igc-install/Release \
    -DCMAKE_BUILD_TYPE=Release -DIGC_OPTION__ARCHITECTURE_TARGET=Linux64 \
    ../igc/IGC
make -j$N_JOBS VERBOSE=1
make -j$N_JOBS package VERBOSE=1

sudo dpkg -x intel-igc-core_*.deb /opt/intel
sudo dpkg -x intel-igc-media_*.deb /opt/intel
sudo dpkg -x intel-igc-opencl-devel_*.deb /opt/intel
sudo dpkg -x intel-igc-opencl_*.deb /opt/intel
sudo ldconfig
