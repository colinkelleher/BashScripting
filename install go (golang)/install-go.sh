#!/bin/bash

# Jonathan Hanley 117473096
# Colin Kelleher 117303363

# updating and upgrading the installed packages using apt-get.
echo updating and upgrading the installed packages
sudo apt-get upgrade
sudo apt-get update

# getting the golang language using wget
echo getting the golang language
wget https://dl.google.com/go/go1.13.7.linux-amd64.tar.gz

# installing the golang language from the .tar.gz file
echo installing the golang language
sudo tar -C /usr/local -xzf go1.13.7.linux-amd64.tar.gz

# setting the path
echo setting the path
export PATH=$PATH:/usr/local/go/bin

# getting the IDE Goland from jetbrains.com
echo getting the IDE
wget http://download.jetbrains.com/go/goland-2019.3.2.tar.gz

# installing the IDE by untarring the file and installing it to /opt
echo installing the IDE
sudo tar xzf goland-2019.3.2.tar.gz -C /opt

# starting the IDE for the first time
echo starting the IDE for the first time
/opt/GoLand-2019.3.2/bin/goland.sh

