#!/bin/bash
INSTALL_TEMP_ARCHIVE_URL=https://github.com/jadentheprogrammer06/custom-autoinstall-linux/archive/master.zip
INSTALL_PATH=/usr/local/bin
while true
do
printf "\nWould you like to install/update/remove your custom-autoinstall-linux script? \n[I]Install [U]Update [R]Remove or [N]No.\n>>>"; read yesorno
    if [[ $yesorno == "" ]]; then
        printf "\nThat is not an option. \n"
    elif [[ $yesorno == "I"* ]]; then
        printf "\nInstalling script to $INSTALL_PATH PATH directory...\n"
        mkdir ~/Downloads/temp-script-install/
        cd ~/Downloads/temp-script-install/
        wget $INSTALL_TEMP_ARCHIVE_URL
        unzip ./master.zip
        sudo cp custom-autoinstall-linux-master/bin/custom-autoinstall-linux.sh $INSTALL_PATH
        cd ~/Downloads/
        rm temp-script-install -r
        break
    elif [[ $yesorno == "U"* ]]; then
        printf "\nUpdating script in $INSTALL_PATH PATH directory...\n"
        sudo rm $INSTALL_PATH/custom-autoinstall-linux.sh # removes existing before updating.
        mkdir ~/Downloads/temp-script-install/
        cd ~/Downloads/temp-script-install/
        wget $INSTALL_TEMP_ARCHIVE_URL
        unzip ./master.zip
        sudo cp custom-autoinstall-linux-master/bin/custom-autoinstall-linux.sh $INSTALL_PATH
        cd ~/Downloads/
        rm temp-script-install -r
        break
    elif [[ $yesorno == "R"* ]]; then
        printf "\nRemoving script from $INSTALL_PATH directory...\n"
        sudo rm $INSTALL_PATH/custom-autoinstall-linux.sh
        break
    elif [[ $yesorno == "N"* ]]; then
        printf "\nNot installing/updating. Exiting script.\n" && break;
    else
        printf "\nThat is not an option. \n"
    fi
done
exit
