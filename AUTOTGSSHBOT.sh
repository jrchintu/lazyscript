#!/bin/bash
apt update -y && apt install nodejs -y && sudo apt install npm -y 
apt install -y make python build-essential && git clone --depth=1 https://github.com/botgram/shell-bot.git temp && mv -v temp/* . && rm -rf temp
npm install && npm install -g forever
touch starter.sh && nulll='#!/bin/bash' && echo "$nulll" >> starter.sh && echo "forever start server.js" >> starter.sh
touch config.json && echo "{" >> config.json
echo '    "authToken": "******************************************",' >> config.json
echo '    "owner": *********' >> config.json && echo "}" >> config.json
(crontab -l ; echo "@reboot /bin/bash -c bot_token=*********** && curl -s -X POST https://api.telegram.org/bot***************/sendMessage -d chat_id=-********** -d text="*VM STARTED*" && bash location/to/this/script") | crontab -
chmod -R 777 starter.sh && bash starter.sh && cd ..