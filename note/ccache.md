# CCACHE

##### WITH COMPRESSION 
```
export USE_CCACHE=1
export CCACHE_DIR="$HOME/.ccache"
export CCACHE_EXEC="$(which ccache)"
ccache -M 20G
ccache -o compression=true
ccache -z
ccache -s
```
##### WITHOUT COMPRESSION
```
export USE_CCACHE=1
export CCACHE_DIR="$HOME/.ccache"
export CCACHE_EXEC="$(which ccache)"
ccache -M 20G
ccache -z
ccache -s
```
##### READONLY CCACHE
```
export USE_CCACHE=1
export CCACHE_DIR="$HOME/.ccache"
export CCACHE_EXEC="$(which ccache)"
export CCACHE_READONLY=true
ccache -M 20G
ccache -o compression=true
ccache -z
ccache -s
```
##### ADD TO ~/.bashrc
```
cat <<EOF >> $HOME/.bashrc
export USE_CCACHE=1
export CCACHE_DIR="$HOME/.ccache"
export CCACHE_EXEC="$(which ccache)"
ccache -M 20G
ccache -o compression=true
EOF
```
