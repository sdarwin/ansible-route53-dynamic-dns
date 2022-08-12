#!/bin/bash

apt-get install -y unzip
pip3 install boto3
mkdir downloads
cd downloads
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws configure
