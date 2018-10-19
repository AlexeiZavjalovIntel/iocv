#!/bin/bash

export http_proxy="http://proxy.sc.intel.com:911"
export https_proxy="https://proxy.sc.intel.com:911"

export LD_LIBRARY_PATH="/opt/intel/lib/"
export PKG_CONFIG_PATH="/opt/intel/lib/pkgconfig"

export MFX_HOME=/opt/intel/

#export PATH=/opt/intel/usr/bin/

#export LIBVA_DRIVERS_PATH=/opt/intel/lib/dri
#export LIBVA_DRIVER_NAME=iHD

#export HDDL_INSTALL_DIR=/usr/local
#export LD_LIBRARY_PATH=/usr/lib64:/usr/local/lib:${HDDL_INSTALL_DIR}/lib/ubuntu_16.04/intel64/:${HDDL_INSTALL_DIR}/lib/
