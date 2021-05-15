#!/bin/bash

#PATH=/usr/bin/node:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
#add  `@reboot bash /path/to/starter.sh` to `sudo crontab -u {username} -e`


if [ $(ps -e -o uid,cmd | grep $UID | grep node | grep -v grep | wc -l | tr -s "$
then
        forever start ~/shell-bot/server.js
fi