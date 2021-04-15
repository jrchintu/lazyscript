#!/bin/bash

#prompt for romname
echo enter the rom url without "https://" and ".git"
read -r rom_name

#init rom and remove junk
repo init -q --no-repo-verify --depth=1 -u git://"$rom_name".git -b 11.x -g default,-device,-mips,-darwin,-notdefault
git clone https://github.com/Apon77Lab/android_.repo_local_manifests.git --depth 1 -b aex .repo/local_manifests -q
rm -rf .repo

#variables
com () { 
    tar --use-compress-program="pigz -k -$2 " -cf "$1".tar.gz "$1"
}

#compression
time com SOURCECODE 1
