#!/bin/bash

. ../scripts/set_environment.sh

rm -rf ocl_headers
git clone https://github.com/KhronosGroup/OpenCL-Headers.git ocl_headers
cd ocl_headers/
sudo cp -rf CL/ /opt/intel/include/
sudo ln -sf /opt/intel/include/CL/cl_va_api_media_sharing_intel.h /opt/intel/include/CL/va_ext.h
