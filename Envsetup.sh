#!/bin/sh

sudo su
add-apt-repository ppa:openjdk-r/ppa
apt-get install git-core 
apt-get update
exit
mkdir ~/bin
PATH=~/bin:$PATH
cd ~/bin
curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
cd
git clone https://github.com/akhilnarang/scripts.git scripts
cd scripts
bash setup/android_build_env.sh
