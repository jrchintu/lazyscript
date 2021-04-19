#!/bin/bash
echo ""
echo ""
echo "Welcome to the script."

# Install stuff
sudo apt update -y
sudo apt upgrade -y
sudo apt autoremove -y
echo "Installing neccessary stuff for you."
sudo apt-get install --ignore-missing -y snap curl lsb-core

sudo tlp start
sudo apt install git-all -y

echo "Put your github username"
read -r username 
git config --global user.name "$username"

echo "Put your github useremail"
read -r useremail
git config --global user.email "$useremail"

git config --global color.ui true
git config --global core.editor emacs
echo "Github username is: $(git config user.name)"
echo "Github useremail is: $(git config user.email)"

echo "The OS installed is $(lsb_release -d | cut -d ':' -f 2 | sed -e 's/^[[:space:]]*//')."
OS_VERSION="$(lsb_release -d | cut -d ':' -f 2 | sed -e 's/^[[:space:]]*//')"
echo "$OS_VERSION"
if [[ ${LSB_RELEASE} =~ "Ubuntu" ]]; then
sudo apt install ubuntu-restricted-extras -y
fi

echo "Done"
echo "Exiting in 5 seconds"
echo -ne '######                    (33%)\r'
sleep 1
echo -ne '#############             (66%)\r'
sleep 3
echo -ne '#######################  (100%)\r'
echo -ne '\n'
