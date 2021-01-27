#!/bin/bash
read -r -p "TYPE ROM U WANT TO BAKE:"
rom_fake=$REPLY
mkdir -p /mnt/"$rom_fake"
chmod -R 777 /mnt/"$rom_fake"
mkdir -p /mnt/"$rom_fake"/ccache
chmod -R 777 /mnt/"$rom_fake"/ccache
export CCACHE_DIR=/mnt/$rom_fake/ccache
CCACHE_EXEC=$(which ccache)
export CCACHE_EXEC
export USE_CCACHE=1
ccache -M 50