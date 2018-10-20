#!/bin/bash

set -e

. ../scripts/set_environment.sh

rm -rf ocl-icd
git clone https://github.com/OCL-dev/ocl-icd.git
cd ocl-icd/
sudo apt-get install ruby -y
./bootstrap
./configure --prefix=/opt/intel/
make -j$N_JOBS
sudo make install
