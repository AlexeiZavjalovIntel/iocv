#!/bin/bash

. ../scripts/set_environment.sh

rm -f clinfo*.deb
apt-get download clinfo
sudo dpkg -x clinfo*.deb /opt/intel/

rm -f vainfo*.deb
apt-get download vainfo
sudo dpkg -x vainfo*.deb /opt/intel/
