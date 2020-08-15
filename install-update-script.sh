	#!/bin/bash
INSTALL_TEMP_ARCHIVE_URL=https://github.com/jadentheprogrammer06/custom-autoinstall-linux/archive/master.zip
INSTALL_PATH=/usr/local/bin
while true
do
printf "\nWould you like to install/update/remove your custom-autoinstall-linux script? \n[I]Install [U]Update [R]Remove or [N]No.\n>>>"; read yesorno
    if [[ $yesorno == "" ]]; then
        printf "\nThat is not an option. \n"
    elif [[ $yesorno == "I"* ]]; then
        while true
        do
        printf "\nAre you running this program on Ubuntu AMD64 (Normal) or Raspbian (Raspberry Pi)?\n[ENTER/Default]Ubuntu AMD64 [R]Installs Raspberry Pi script.\n>>>"; read selectscript
        if [[ $selectscript == "" ]]; then
            printf "\nInstalling for Ubuntu AMD64 systems. \n"
            printf "\nInstalling script to $INSTALL_PATH PATH directory...\n"
            mkdir ~/Downloads/temp-script-install/
            cd ~/Downloads/temp-script-install/
            wget $INSTALL_TEMP_ARCHIVE_URL
            unzip ./master.zip
            sudo cp custom-autoinstall-linux-master/bin/custom-autoinstall-linux.sh $INSTALL_PATH/custom-autoinstall-linux
            cd ~/Downloads/
            rm temp-script-install -r
            break
        elif [[ $selectscript == "R" ]]; then
            printf "\nInstalling for Raspberry Pi systems.\n"
            printf "\nInstalling script to $INSTALL_PATH PATH directory...\n"
            mkdir ~/Downloads/temp-script-install/
            cd ~/Downloads/temp-script-install/
            wget $INSTALL_TEMP_ARCHIVE_URL
            unzip ./master.zip
            sudo cp custom-autoinstall-linux-master/bin/custom-autoinstall-raspi.sh $INSTALL_PATH/custom-autoinstall-raspi
            cd ~/Downloads/
            rm temp-script-install -r
            break
        else
            printf "\nThat is not an option. \n"
        fi
        done
    elif [[ $yesorno == "U"* ]]; then
        printf "\nUpdating script in $INSTALL_PATH PATH directory...\n"
        sudo rm $INSTALL_PATH/custom-autoinstall-linux # removes existing before updating.
        mkdir ~/Downloads/temp-script-install/
        cd ~/Downloads/temp-script-install/
        wget $INSTALL_TEMP_ARCHIVE_URL
        unzip ./master.zip
        sudo cp custom-autoinstall-linux-master/bin/custom-autoinstall-linux.sh $INSTALL_PATH/custom-autoinstall-linux
        cd ~/Downloads/
        rm temp-script-install -r
        printf "\nAttempted to update script. \n"
        break
    elif [[ $yesorno == "R"* ]]; then
        printf "\nRemoving script from $INSTALL_PATH directory...\n"
        [[ -f $INSTALL_PATH/custom-autoinstall-linux ]] && sudo rm $INSTALL_PATH/custom-autoinstall-linux && printf "\nAttempted to remove custom-autoinstall-linux script. \n" || printf "\ncustom-autoinstall-linux script was not detected in $INSTALL_PATH."
        [[ -f $INSTALL_PATH/custom-autoinstall-raspi ]] && sudo rm $INSTALL_PATH/custom-autoinstall-raspi && printf "\nAttempted to remove custom-autoinstall-raspi script. \n" || printf "\ncustom-autoinstall-raspi script was not detected in $INSTALL_PATH."
        break
    elif [[ $yesorno == "N"* ]]; then
        printf "\nNot installing/updating. Exiting script.\n" && break;
    else
        printf "\nThat is not an option. \n"
    fi
done
exit
