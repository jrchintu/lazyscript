# Snippets
## *Azure temp setup*
```
rom_name='awaken' && \
sudo mkdir -p /mnt/$rom_name && \
sudo chmod -R 666 /mnt/$rom_name && \
sudo chmod -R 777 /mnt/$rom_name/ && \
cd /mnt/$rom_name/
```

## *Auto tmate*
```
sudo apt update -y && \
sudo apt install tmux tmate -y && \
unset TMUX && ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa && \
tmate -S /tmp/tmate.sock new-session -d && \
tmate -S /tmp/tmate.sock wait tmate-ready && \
SENDSHELL=$(tmate -S /tmp/tmate.sock display -p '#{tmate_ssh}') && \
echo $SENDSHELL
```
## *Ccache*
```
ccache_dir=/mnt/aosip/ccache && max_ccache=40G && export CCACHE_DIR=$ccache_dir && ccache -M $max_ccache && export USE_CCACHE=1 && export CCACHE_EXEC=$(which ccache)
```
