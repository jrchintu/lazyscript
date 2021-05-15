# Snippets

## Env setup for AOSP (Run Part By Part Only fot x86_64)
```
sudo su
add-apt-repository ppa:openjdk-r/ppa -y
apt install git-core p7zip-full -y 
apt update -y && apt upgrade -y && exit
```
```
mkdir ./bin && PATH=./bin:$PATH
curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ./bin/repo && chmod a+x ./bin/repo
git clone https://github.com/akhilnarang/scripts.git scripts && cd scripts && \
bash setup/android_build_env.sh && cd ..
```
## Azure temp setup
```
rom_name='awaken' && \
sudo mkdir -p /mnt/$rom_name && \
sudo chmod -R 666 /mnt/$rom_name && \
sudo chmod -R 777 /mnt/$rom_name/ && \
cd /mnt/$rom_name/
```

## GDUPLOAD (Gdrive Upload)
```
curl --compressed -Ls https://github.com/labbots/google-drive-upload/raw/master/install.sh | sh -s
```

## Auto tmate
```
sudo apt update -y && \
sudo apt install tmux tmate -y && \
unset TMUX && ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa <<< y && \
tmate -S /tmp/tmate.sock new-session -d && \
tmate -S /tmp/tmate.sock wait tmate-ready && \
SENDSHELL=$(tmate -S /tmp/tmate.sock display -p '#{tmate_ssh}') && \
echo $SENDSHELL
```
## Ccache
```
{ 
echo USE_CCACHE=1
echo "export CCACHE_DIR=\"/mnt/aosip/ccache\""
}>>~/.bashrc && source ~/.bashrc

ccache -M 30G
export USE_CCACHE=1
export CCACHE_EXEC=$(command -v ccache)
export CCACHE_DIR="/mnt/aosip/ccache"
```
##### Compression & Compilercheck
```
ccache -o compression=true

# ccheck {none; content; mtime}
export CCACHE_COMPILERCHECK="content"
```

## Shell-Bot
```
sudo apt update -y
sudo apt-get install -y nodejs
curl -sL https://deb.nodesource.com/setup_current.x | sudo -E bash - && apt install --assume-yes nodejs
curl https://www.npmjs.com/install.sh | sudo sh 
sudo npm install -g forever
bash <(curl -s {https://raw.githubusercontent.com/jrchintu/aex/debloat/Assets/autoshellbot.sh})
```
