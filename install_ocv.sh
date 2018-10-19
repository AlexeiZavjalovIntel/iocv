#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

function jumpto
{
    label=$1
    cmd=$(sed -n "/$label:/{:a;n;p;ba};" $0 | grep -v ':$')
    eval "$cmd"
    exit
}

SCRIPT_FOLDER=`pwd`
WORK_FOLDER=`pwd`/WORK

step_0=${1:-"step_0"}
jumpto $step_0

step_0:
echo -e "\n${GREEN}step_0: installing basic dependencies...${NC}\n"
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install ccache cmake pkg-config dh-autoreconf git -y
rm -rf $WORK_FOLDER
mkdir $WORK_FOLDER
cd $WORK_FOLDER
echo "/opt/intel/lib/" | sudo tee --append /etc/ld.so.conf.d/opt_intel.conf

step_1:
echo -e "\n${GREEN}step_1: installing libva...${NC}\n"
cd $WORK_FOLDER
${SCRIPT_FOLDER}/install_libva.sh
rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}step 1 failed${NC}"; exit $rc; fi

step_2:
echo -e "\n${GREEN}step_2: installing gmmlib...${NC}\n"
cd $WORK_FOLDER
${SCRIPT_FOLDER}/install_gmmlib.sh
rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}step 2 failed${NC}"; exit $rc; fi

step_3:
echo -e "\n${GREEN}step_3: installing media driver...${NC}\n"
cd $WORK_FOLDER
${SCRIPT_FOLDER}/install_media_driver.sh
rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}step 3 failed${NC}"; exit $rc; fi

step_4:
echo -e "\n${GREEN}step_4: installing Media SDK...${NC}\n"
cd $WORK_FOLDER
${SCRIPT_FOLDER}/install_mediasdk.sh
rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}step 4 failed${NC}"; exit $rc; fi

step_5:
echo -e "\n${GREEN}step_5: installing OpenCL wrapper...${NC}\n"
cd $WORK_FOLDER
${SCRIPT_FOLDER}/install_ocl_wrapper.sh
rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}step 5 failed${NC}"; exit $rc; fi

step_6:
echo -e "\n${GREEN}step_6: installing Khronos OpenCL headers...${NC}\n"
cd $WORK_FOLDER
${SCRIPT_FOLDER}/install_ocl_headers.sh
rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}step 6 failed${NC}"; exit $rc; fi

step_7:
echo -e "\n${GREEN}step_7: installing OpenCV...${NC}\n"
cd $WORK_FOLDER
${SCRIPT_FOLDER}/install_opencv.sh
rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}step 7 failed${NC}"; exit $rc; fi

step_8:
echo -e "\n${GREEN}step_8: installing clinfo and vainfo...${NC}\n"
cd $WORK_FOLDER
${SCRIPT_FOLDER}/install_tools.sh
rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}step 8 failed${NC}"; exit $rc; fi

echo -e "\n${GREEN}Setup is done. You can now install Intel Neo driver manually or enter '$0 step_neo' to build it on this machine.${NC}\n"
exit 0
step_neo:
echo -e "\n${GREEN}step_neo: installing Intel OpenCL Neo...${NC}\n"
cd $WORK_FOLDER
${SCRIPT_FOLDER}/install_neo.sh
rc=$?; if [[ $rc != 0 ]]; then echo -e "${RED}step 8 failed${NC}"; exit $rc; fi
