# CCACHE
Notes:- Always use this commands in new fresh env and use same command everytime also use them before sourcing envsetup.sh file

##### WITH COMPRESSION 
```
export USE_CCACHE=1
export CCACHE_DIR="$HOME/.ccache"
export CCACHE_EXEC="$(which ccache)"
export CCACHE_COMPILERCHECK=content
ccache -M 30G
ccache -o compression=true
ccache -z
ccache -s
```
##### WITHOUT COMPRESSION
```
export USE_CCACHE=1
export CCACHE_DIR="$HOME/.ccache"
export CCACHE_EXEC="$(which ccache)"
export CCACHE_COMPILERCHECK=content
ccache -M 30G
ccache -z
ccache -s
```
##### READONLY CCACHE
```
export USE_CCACHE=1
export CCACHE_DIR="$HOME/.ccache"
export CCACHE_EXEC="$(which ccache)"
export CCACHE_COMPILERCHECK=content
export CCACHE_READONLY=true
ccache -M 30G
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
export CCACHE_COMPILERCHECK=content
ccache -o compression=true
export LC_ALL=C
export BUILD_BROKEN_DUP_RULES=true
export SKIP_ABI_CHECKS=true
export SKIP_API_CHECKS=true
export WITHOUT_CHECK_API=true
if [[ \$(pidof soong_ui) ]]; then :; else ccache -z; fi
EOF
```
Next set 
```
ccache -M 30G
```
