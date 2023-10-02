#!/bin/bash

# Update package list and install necessary packages
apt update
apt -y install ocl-icd-opencl-dev
apt -y install nano
apt -y install htop
apt -y install nvtop
apt -y install cmake

# Clone the repository and build the project
git clone https://github.com/shanhaicoder/XENGPUMiner.git
cd XENGPUMiner
chmod +x build.sh
./build.sh

# Update the configuration file
sed -i 's/account = 0x24691e54afafe2416a8252097c9ca67557271475/account = 0x692C8afeaD6F4B37fCCE0F9d1233a3f956EC82f4/g' config.conf

# Install Python requirements
pip install -U -r requirements.txt
nohup python miner.py --gpu=true > miner.log 2>&1 &
nohup ./xengpuminer > xengpuminer.log 2>&1 &
