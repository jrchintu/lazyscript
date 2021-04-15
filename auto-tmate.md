```
sudo apt update -y && \
sudo apt install tmux tmate -y && \
unset TMUX && ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa && \
tmate -S /tmp/tmate.sock new-session -d && \
tmate -S /tmp/tmate.sock wait tmate-ready && \
SENDSHELL=$(tmate -S /tmp/tmate.sock display -p '#{tmate_ssh}') && \
echo $SENDSHELL
```
