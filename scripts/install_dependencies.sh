#!/bin/bash

sudo add-apt-repository universe
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install ccache cmake pkg-config dh-autoreconf git -y
