#!/bin/bash

### ABOUT
# May be farther optimized to be compatible with more system architectures \
#  and/or different linux distros and package managers.
# In my case, I designed this for modern Ubuntu-based linux systems \
#  running on AMD64. (What I am most likely to use on a regular basis)
# Probably also works on Debian and Mint.
###

### *NOTE:
# In the future, I may decide to implement CLI args/flags and use variables on each program's loop.
# Additionally, I may design a function which is called before each loop.
# If a flag isn't passed the function would just skip the loop, saving time.
# Flags are also more efficient because the user will not have to input as much.
# There would also be one option for "yes to all".
# Right now I am just using basic "yes-or-no if statements".
###

### DEFAULT VARIABLES
# Includes placeholder values.
INSTALL_BRAVE=1
INSTALL_GIMP=1
INSTALL_KRITA=1
INSTALL_VIRTUALBOX=1
INSTALL_ANKI=1
INSTALL_MINECRAFT=1
INSTALL_MINETEST=1
INSTALL_RETROARCH=1
INSTALL_PCSX2=1
INSTALL_OKULAR=1
INSTALL_OBS=1
INSTALL_BLENDER=1
INSTALL_AUDACITY=1
INSTALL_VLC=1
INSTALL_SYNCTHING=1
INSTALL_ALACARTE=1
###

### Installing Brave browser.
while [[ $INSTALL_BRAVE=1 ]];
do
printf "\nWould you like to install brave-browser?"; read yesorno
    if [[ $yesorno == "" ]]; then
        printf "\nThat is not an option. [y]yes or [n]no."
    elif [[ $yesorno == "y"* ]]; then
        printf "\nAttempting to install brave-browser...\n"
        sudo apt install apt-transport-https curl
        curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
        echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
        sudo apt update
        sudo apt install brave-browser
        break
    elif [[ $yesorno == "n"* ]]; then
        printf "\nNot installing brave-browser" && break;
    fi
done
###

### Installing GIMP
while [[ $INSTALL_GIMP=1 ]];
do
printf "\nWould you like to install GIMP?"; read yesorno
    if [[ $yesorno == "" ]]; then
        printf "\nThat is not an option. [y]yes or [n]no."
    elif [[ $yesorno == "y"* ]]; then
        printf "\nAttempting to install GIMP...\n"
        sudo apt install gimp
    elif [[ $yesorno == "n"* ]]; then
        printf "\nNot installing GIMP" && break;
    fi
done
###
### Exit the script
exit
    
