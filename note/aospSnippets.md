# Snippets

## Env setup for AOSP (Run Part By Part Only fot x86_64)
```
sudo apt update -y
sudo apt upgrade -y
sudo apt autoremove --purge -y
sudo add-apt-repository ppa:openjdk-r/ppa -y
sudo apt install git-core p7zip-full rclone pigz -y

curl https://storage.googleapis.com/git-repo-downloads/repo >./repo
sudo mv repo /usr/bin/repo
sudo chmod a+x /usr/bin/repo
PATH=/usr/bin/repo:$PATH

git clone --depth=1 https://github.com/akhilnarang/scripts.git scripts
cd scripts && sudo bash setup/android_build_env.sh && cd .. && rm -rf scripts
```
## EXTRA FLAGS
```
export SELINUX_IGNORE_NEVERALLOWS=true
```
```
export LC_ALL=C
export SKIP_ABI_CHECKS=true
export SKIP_API_CHECKS=true
export WITHOUT_CHECK_API=true
```
## Azure temp setup
```
rom_name='ROM' && \
sudo mkdir -p /mnt/$rom_name && \
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

## Shell-Bot
```
sudo apt update -y
sudo apt-get install -y nodejs
curl -sL https://deb.nodesource.com/setup_current.x | sudo -E bash - && apt install --assume-yes nodejs
curl https://www.npmjs.com/install.sh | sudo sh 
sudo npm install -g forever
bash <(curl -s {https://raw.githubusercontent.com/jrchintu/aex/debloat/Assets/autoshellbot.sh})
```

## SWAP
```
# Check if swap is there
sudo swapon --show
free -h
df -h

# Make swapfile & Set correct permission
sudo fallocate -l 1G /swapfile
sudo chmod 600 /swapfile
ls -lh /swapfile

# Mark it as swap
sudo mkswap /swapfile

# Turn swap on and check
sudo swapon /swapfile
sudo swapon --show

# Take fstab backup && make swap permanent
sudo cp /etc/fstab /etc/fstab.bak
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
```

## FIX BASHRC
```
/bin/cp /etc/skel/.bashrc ~/
source ~/.bashrc
```

## SWAPPINESS
For a Desktop, a swappiness setting of 60 is not a bad value. For a server, you might want to move it closer to 0.
For instance, to set the swappiness to 10, we could type:
```
# Check swappiness
cat /proc/sys/vm/swappiness

# Change swappiness
sudo sysctl vm.swappiness=10

# Persiste across reboot
sudo cp /etc/sysctl.conf /etc/sysctl.conf.bak
sudo /bin/su -c "echo 'vm.swappiness=10' >> /etc/sysctl.conf"
```
## CACHE_PRESSURE
Another related value that you might want to modify is the vfs_cache_pressure. This setting configures how much the system will choose to cache inode and dentry information over other data.Basically, this is access data about the filesystem. This is generally very costly to look up and very frequently requested, so it’s an excellent thing for your system to cache. You can see the current value by querying the proc filesystem again. As it is currently configured, our system removes inode information from the cache too quickly. We can set this to a more conservative setting like 50 :
```
#check CACHE_PRESSURE
cat /proc/sys/vm/vfs_cache_pressure

#change CACHE_PRESSURE
sudo sysctl vm.vfs_cache_pressure=50

#persist across reboot
sudo cp /etc/sysctl.conf /etc/sysctl.conf.bak
sudo /bin/su -c "echo 'vm.vfs_cache_pressure=50' >> /etc/sysctl.conf"
```
