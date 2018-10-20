#!/bin/bash

set -e

. ../scripts/set_environment.sh

sudo apt-get install ruby -y
rm -rf ocl-icd
git clone https://github.com/OCL-dev/ocl-icd.git
cd ocl-icd/
./bootstrap
./configure --prefix=/opt/intel/
make -j$N_JOBS
sudo make install
