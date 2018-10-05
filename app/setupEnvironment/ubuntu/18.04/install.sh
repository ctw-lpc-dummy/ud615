#!/bin/bash

# Create environment variable for correct distribution
export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"

# Add the Cloud SDK distribution URI as a package source
echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# Import the Google Cloud Platform public key
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

# Delete old Google Cloud SDK
sudo apt remove google-cloud-sdk -y

#Ensure that you have the dependencies to setup the project
sudo apt update

sudo apt install curl tar google-cloud-sdk -y

# Download "golang" latest binaries (e.g.: v1.11.1) to the temporary folder
sudo curl https://dl.google.com/go/go1.11.1.linux-amd64.tar.gz >> /var/tmp/goLangSetup.tar.gz

# (If exists) delete the old binaries
sudo rm -R /usr/local/go

# Extract the binaries and install them (a.k.a. copy :D )
sudo tar -C /usr/local -xzf /var/tmp/goLangSetup.tar.gz

# Modify PATH enviroment variable
echo "Please execute the following command on your shell"

echo 'PATH=$PATH:/usr/local/go/bin'
