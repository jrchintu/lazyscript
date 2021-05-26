#!/bin/bash
if ! [ $(id -u) = 0 ]; then
   echo "The script need to be run as root." >&2
fi
if [ $SUDO_USER ]; then
echo ""
echo ""
echo ""
echo "                                                                                                                             "
echo "#  #  # ###### #       ####   ####  #    # ######    #####  ####     #    # #   #     ####   ####  #####  # #####  #####     "
echo "#  #  # #      #      #    # #    # ##  ## #           #   #    #    ##  ##  # #     #      #    # #    # # #    #   #       "
echo "#  #  # #####  #      #      #    # # ## # #####       #   #    #    # ## #   #       ####  #      #    # # #    #   #       "
echo "#  #  # #      #      #      #    # #    # #           #   #    #    #    #   #           # #      #####  # #####    #       "
echo "#  #  # #      #      #    # #    # #    # #           #   #    #    #    #   #      #    # #    # #   #  # #        #       "
echo " ## ##  ###### ######  ####   ####  #    # ######      #    ####     #    #   #       ####   ####  #    # # #        #    ### "
echo "                                                                                                                             "
echo ""
echo "The OS installed is `lsb_release -d | cut -d ':' -f 2 | sed -e 's/^[[:space:]]*//'`."
OS_VERSION="$(lsb_release -d | cut -d ':' -f 2 | sed -e 's/^[[:space:]]*//')"

if [[ ${OS_VERSION} =~ "Mint" || ${LSB_RELEASE} =~ "Ubuntu" ]]; then
sudo apt update -y
sudo apt upgrade -y
sudo apt remove snapd -y
sudo apt install nano tmate -y
sudo apt autoremove -y

elif [[ ${OS_VERSION} =~ "Manjaro" || ${LSB_RELEASE} =~ "Arch" ]]; then
sudo pacman -Rcns snapd --noconfirm
sudo pacman -Syu --noconfirm

elif [[ ${OS_VERSION} -ne "Mint" || ${LSB_RELEASE} -ne "Ubuntu" ]]; then
echo "You have installed OS other than Arch and Ubuntu."
fi

echo "Done"
echo "Exiting in 5 seconds"
echo -ne '######                    (33%)\r'
sleep 1
echo -ne '#############             (66%)\r'
sleep 3
echo -ne '#######################  (100%)\r'
echo -ne '\n'
