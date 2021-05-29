# CCACHE

##### WITH COMPRESSION 
```
export USE_CCACHE=1
export CCACHE_EXEC="$(which ccache)"
export CCACHE_DIR="$HOME/.ccache"
export CCACHE_COMPRESS=1
export CCACHE_COMPRESSLEVEL=1
ccache -M 30G
ccache -z
ccache -s
```
##### WITHOUT COMPRESSION
```
export USE_CCACHE=1
export CCACHE_EXEC="$(which ccache)"
export CCACHE_DIR="$HOME/.ccache"
ccache -M 30G
ccache -z
ccache -s
```
##### READONLY CCACHE
```
export USE_CCACHE=1
export CCACHE_EXEC="$(which ccache)"
export CCACHE_DIR="$HOME/.ccache"
export CCACHE_COMPRESS=1
export CCACHE_COMPRESSLEVEL=1
export CCACHE_READONLY=true
ccache -M 30G
ccache -z
ccache -s
```
