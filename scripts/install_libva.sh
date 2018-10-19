#!/bin/bash

. ../scripts/set_environment.sh

sudo apt-get install meson libdrm-dev automake libtool libwayland-dev libx11-dev \
    libdrm-dev xorg xorg-dev openbox libx11-dev libgl1-mesa-glx libgl1-mesa-dev -y
rm -rf libva
git clone https://github.com/intel/libva.git
cd libva
git checkout tags/2.3.0
./autogen.sh --enable-wayland --prefix=/opt/intel
make -j32
sudo make install

sudo cp va/x11/*.h /opt/intel/include/va/
sudo ln -sf /opt/intel/lib/libva.so /opt/intel/libva.so.1
sudo ln -sf /opt/intel/lib/libva-x11.so /opt/intel/lib/libva-x11.so.1
sudo ln -sf /opt/intel/lib/libva-drm.so /opt/intel/lib/libva-drm.so.1
sudo ln -sf /opt/intel/lib/libva-glx.so /opt/intel/lib/libva-glx.so.1
sudo ln -sf /opt/intel/lib/libva-wayland.so /opt/intel/lib/libva-wayland.so.1
