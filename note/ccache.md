
# CCACHE

```
export USE_CCACHE=1
export CCACHE_EXEC="$(which ccache)"
export CCACHE_DIR="$HOME/.ccache"
export CCACHE_COMPRESS=1
export CCACHE_COMPILERCHECK=content
ccache -M 30G
```
##### OR

```
export USE_CCACHE=1
export CCACHE_EXEC="$(which ccache)"
export CCACHE_DIR="$HOME/.ccache"
ccache -o compression=true
ccache -M 30G
```
##### READONLY
```
sudo mkdir /mnt/ccache
sudo mount --bind $PWD/ccache /mnt/ccache

export USE_CCACHE=1
export CCACHE_EXEC="$(which ccache)"
export CCACHE_DIR="$HOME/.ccache"
ccache -M 30G -F 0
```
