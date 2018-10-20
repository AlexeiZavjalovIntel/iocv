#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

# Add to front of path
prepend_path()
{
    if eval test -z "\"\${$1}\"" ; then
	eval "export $1=$2"
    elif ! eval test -z "\"\${$1##*:$2:*}\"" -o -z "\"\${$1%%*:$2}\"" -o -z "\"\${$1##$2:*}\"" -o -z "\"\${$1##$2}\"" ; then
	eval "export $1=$2:\$$1"
    fi
}

[[ "${BASH_SOURCE[0]}" == "${0}" ]] && echo -e "${RED}Please run script with 'source' or '.' prefix to export variables.${NC}" && exit 1

prepend_path LD_LIBRARY_PATH "/opt/intel/lib"
prepend_path LD_LIBRARY_PATH "/opt/intel/usr/lib"
prepend_path PKG_CONFIG_PATH "/opt/intel/lib/pkgconfig"
prepend_path PKG_CONFIG_PATH "/opt/intel/usr/lib/pkgconfig"
prepend_path PATH "/opt/intel/bin"
prepend_path PATH "/opt/intel/usr/bin"

export LIBVA_DRIVERS_PATH="/opt/intel/lib/dri"
export LIBVA_DRIVER_NAME=iHD

export MFX_HOME="/opt/intel/"

echo -e "${GREEN}The SDK environment is ready${NC}"
echo
echo -e "LD_LIBRARY_PATH = \"$LD_LIBRARY_PATH\""
echo -e "PKG_CONFIG_PATH = \"$PKG_CONFIG_PATH\""
echo -e "LIBVA_DRIVERS_PATH = \"$LIBVA_DRIVERS_PATH\""
echo -e "LIBVA_DRIVER_NAME = \"$LIBVA_DRIVER_NAME\""
echo -e "MFX_HOME = \"$MFX_HOME\""
echo
echo -e "OpenCV Version =" `opencv_version`
echo -e "LibVA Version =" `pkg-config --variable="libva_version" libva`
echo -e "OpenCL Version =" `pkg-config --modversion OpenCL`
echo -e "MSDK Dispatcher Version =" `pkg-config --modversion mfx`
