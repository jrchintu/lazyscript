# install vscode for gcloud free shell
```
curl -fsSL https://code-server.dev/install.sh | sh -s -- --method=standalone
PATH="$HOME/.local/bin:$PATH"
chmod -R 777 ~/.local
```
#### uze " chmod -R 777 ~/.local " in case of permission denied
#### uze " code-server --auth=none " to run it
#### u can edit yaml also 

# Bookmark to open git in shell 
javascript:{window.location='https://ssh.cloud.google.com/cloudshell/editor?shellonly=true&cloudshell_git_repo='+encodeURIComponent(window.location.href)}
