
# CCACHE
##### WITH COMPRESSION 
```
export USE_CCACHE=1
export CCACHE_EXEC="$(which ccache)"
export CCACHE_DIR="$HOME/.ccache"
export CCACHE_COMPILERCHECK=content
export CCACHE_COMPRESS=1
ccache -M 30G
ccache -s
```
##### WITHOUT COMPRESSION
```
export USE_CCACHE=1
export CCACHE_EXEC="$(which ccache)"
export CCACHE_DIR="$HOME/.ccache"
export CCACHE_COMPILERCHECK=content
ccache -M 30G
ccache -s
```
##### READONLY CCACHE
```
export USE_CCACHE=1
export CCACHE_EXEC="$(which ccache)"
export CCACHE_DIR="$HOME/.ccache"
export CCACHE_COMPILERCHECK=content
export CCACHE_READONLY=true
ccache -M 30G
ccache -s
```
