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
        printf "\nDetecting for Distro...\n"
        VERSION=`awk '{print $1}' /etc/issue`
        case "Ubuntu" in
            $VERSION)
                printf "\nInstalling for Ubuntu AMD64 systems. \n"
                printf "\nInstalling script to $INSTALL_PATH PATH directory...\n"
                mkdir ~/Downloads/temp-script-install/
                cd ~/Downloads/temp-script-install/
                wget $INSTALL_TEMP_ARCHIVE_URL
                unzip ./master.zip
                sudo cp custom-autoinstall-linux-master/bin/custom-autoinstall-ubuntu.sh $INSTALL_PATH/custom-autoinstall-linux
                cd ~/Downloads/
                rm temp-script-install -r
            ;;
        esac
        case "Pop" in
            $VERSION)
                printf "\nInstalling for Pop OS AMD64 systems. \n"
                printf "\nInstalling script to $INSTALL_PATH PATH directory...\n"
                mkdir ~/Downloads/temp-script-install/
                cd ~/Downloads/temp-script-install/
                wget $INSTALL_TEMP_ARCHIVE_URL
                unzip ./master.zip
                sudo cp custom-autoinstall-linux-master/bin/custom-autoinstall-popos.sh $INSTALL_PATH/custom-autoinstall-linux
                cd ~/Downloads/
                rm temp-script-install -r
            ;;
        esac
        case "Raspberry" in
            $VERSION)
                printf "\nInstalling for Raspberry Pi systems.\n"
                printf "\nInstalling script to $INSTALL_PATH PATH directory...\n"
                mkdir ~/Downloads/temp-script-install/
                cd ~/Downloads/temp-script-install/
                wget $INSTALL_TEMP_ARCHIVE_URL
                unzip ./master.zip
                sudo cp custom-autoinstall-linux-master/bin/custom-autoinstall-raspi.sh $INSTALL_PATH/custom-autoinstall-raspi
                cd ~/Downloads/
                rm temp-script-install -r
            ;;
        esac
        [[ -f /usr/local/bin/custom-autoinstall-linux ]] && printf "\ncustom-autoinstall-linux successfully installed.\n" || printf "\ncustom-autoinstall-linux not successfully installed.\n"
        break
        done
    elif [[ $yesorno == "U"* ]]; then
        if [[ -f $INSTALL_PATH/custom-autoinstall-linux ]]; then
            printf "\nUpdating script in $INSTALL_PATH PATH directory...\n"
            sudo rm $INSTALL_PATH/custom-autoinstall-linux # removes existing before updating.
            mkdir ~/Downloads/temp-script-install/
            cd ~/Downloads/temp-script-install/
            wget $INSTALL_TEMP_ARCHIVE_URL
            unzip ./master.zip # if raspi is installed and update this
            # will install this script but remove raspi FIX THIS.
            sudo cp custom-autoinstall-linux-master/bin/custom-autoinstall-ubuntu.sh $INSTALL_PATH/custom-autoinstall-linux
            cd ~/Downloads/
            rm temp-script-install -r
            break
        elif [[ -f $INSTALL_PATH/custom-autoinstall-raspi ]]; then
            printf "\nUpdating script in $INSTALL_PATH PATH directory...\n"
            sudo rm $INSTALL_PATH/custom-autoinstall-raspi # removes existing before updating.
            mkdir ~/Downloads/temp-script-install/
            cd ~/Downloads/temp-script-install/
            wget $INSTALL_TEMP_ARCHIVE_URL
            unzip ./master.zip
            sudo cp custom-autoinstall-linux-master/bin/custom-autoinstall-raspi.sh $INSTALL_PATH/custom-autoinstall-raspi
            cd ~/Downloads/
            rm temp-script-install -r
            printf "\nAttempted to update script. \n"
            break
        else
            printf "\nNo script to update. HINT: Try installing script first. \n"
        fi
    elif [[ $yesorno == "R"* ]]; then
        [[ -f $INSTALL_PATH/custom-autoinstall-linux ]] && sudo rm $INSTALL_PATH/custom-autoinstall-linux && printf "Removed custom-autoinstall-linux script. \n"
        [[ -f $INSTALL_PATH/custom-autoinstall-raspi ]] && sudo rm $INSTALL_PATH/custom-autoinstall-raspi && printf "Removed custom-autoinstall-raspi script. \n"
        break
    elif [[ $yesorno == "N"* ]]; then
        printf "\nNot installing/updating. Exiting script.\n" && break
    else
        printf "\nThat is not an option. \n"
    fi
done
exit
