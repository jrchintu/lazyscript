
# CCACHE

```
export USE_CCACHE=1
export CCACHE_COMPRESS=1
export CCACHE_COMPILERCHECK=content
export CCACHE_EXEC="$(which ccache)"
export CCACHE_DIR="$HOME/.ccache"
ccache -M 30G
```
##### OR

```
export CCACHE_DIR="$HOME/.ccache"
export USE_CCACHE=1
export CCACHE_EXEC="$(which ccache)"
ccache -M 30G
ccache -o compression=true
```
##### READONLY
```
sudo mkdir /mnt/ccache
sudo mount --bind /home/<your_current_path>/ccache /mnt/ccache

export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
export CCACHE_DIR=/mnt/ccache
ccache -M 30G -F 0
```
