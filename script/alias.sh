#!/bin/bash

git config --global user.name "jrchintu"
git config --global user.email "harrypetersun@outlook.com"
#git config --global push.default matching
export TZ='Asia/Kolkata'

#alias
alias lsa="du -ch -d 1 | sort -hr"
alias git-https="git remote set-url origin https://github.com/$(git remote get-url origin | sed 's/https:\/\/github.com\///' | sed 's/git@github.com://')"
alias git-ssh="  git remote set-url origin git@github.com:$(    git remote get-url origin | sed 's/https:\/\/github.com\///' | sed 's/git@github.com://')"
alias update='sudo apt update -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt clean -y && sudo apt autoclean -y'
alias nb='nano ~/.bashrc'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias g=git
alias ga='git add'
alias gps='git push'
alias gaa='git add --all'
alias gb='git branch'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gf='git fetch'
alias gpl='git pull'
alias gm='git merge'
alias gpsup='git push -u origin $(git_current_branch)'
alias gra='git remote add'
alias grv='git remote -v'
alias grrm='git remote remove'
alias grev='git revert'
alias l='la'
alias md='mkdir -p'
alias rd='rmdir -p'
alias c='clear'
alias n='nano'
alias tx='tmux'
alias t='tmux attach'
alias h='htop'
alias cc='ccache -s'
alias s='source'
alias q='exit'
alias e='echo'
alias du='du -h'
alias dus='du -sh'
alias d='df -h'
alias rmrf='rm -rf'
alias ip="curl ipinfo.io/ip; echo"
alias speed='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -'
alias rs='repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j'
