#!/bin/bash

### ABOUT
# May be farther optimized to be compatible with more system architectures \
#  and/or different linux distros and package managers.
# In my case, I designed this for modern Ubuntu-based linux systems \
#  running on AMD64. (What I am most likely to use on a regular basis)
# Should also work on Debian and Mint.
###

### *NOTE:
# In the future, I may decide to implement CLI args/flags and use variables on each program's loop.
# Additionally, I may design a function which is called before each loop.
# If a flag isn't passed the function would just skip the loop, saving time.
# Flags are also more efficient because the user will not have to input as much.
# There would also be one option for "yes to all".
# Right now I am just using basic "yes-or-no if statements".
#
# Plan on using associative array for this to automate parts into apt-get functions where I wouldn't normally use unique commands.
# Because of unique installation instructions needed for some programs I decided to just keep it simple.
# 
# I plan on adding support for users to add in their own configs to automatically install. Would likely be done through a basic text file.
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
printf "\nWould you like to install Brave? (Better Chrome with more Privacy/Security)"; read yesorno
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
printf "\nWould you like to install GIMP? (Image Editor)"; read yesorno
    if [[ $yesorno == "" ]]; then
        printf "\nThat is not an option. [y]yes or [n]no."
    elif [[ $yesorno == "y"* ]]; then
        printf "\nAttempting to install GIMP...\n"
        sudo apt install gimp
        break
    elif [[ $yesorno == "n"* ]]; then
        printf "\nNot installing GIMP\n" && break;
    fi
done
###
### Installing Krita
while [[ $INSTALL_KRITA=1 ]];
do
printf "\nWould you like to install Krita? (Image Editor)"; read yesorno
    if [[ $yesorno == "" ]]; then
        printf "\nThat is not an option. [y]yes or [n]no."
    elif [[ $yesorno == "y"* ]]; then
        printf "\nAttempting to install Krita...\n"
        sudo apt install krita
        break
    elif [[ $yesorno == "n"* ]]; then
        printf "\nNot installing Krita\n" && break;
    fi
done
###
### Installing Anki
while [[ $INSTALL_ANKI=1 ]];
do
printf "\nWould you like to install Anki? (Useful for Studying; Flash Cards)"; read yesorno
    if [[ $yesorno == "" ]]; then
        printf "\nThat is not an option. [y]yes or [n]no."
    elif [[ $yesorno == "y"* ]]; then
        printf "\nAttempting to install Anki...\n"
        sudo apt install anki
        break
    elif [[ $yesorno == "n"* ]]; then
        printf "\nNot installing Anki\n" && break;
    fi
done
###
### Installing Minetest
while [[ $INSTALL_MINETEST=1 ]];
do
printf "\nWould you like to install Minetest? (Open-Source Minecraft Clone)"; read yesorno
    if [[ $yesorno == "" ]]; then
        printf "\nThat is not an option. [y]yes or [n]no."
    elif [[ $yesorno == "y"* ]]; then
        printf "\nAttempting to install Minetest...\n"
        sudo apt install minetest
        break
    elif [[ $yesorno == "n"* ]]; then
        printf "\nNot installing Minetest\n" && break;
    fi
done
###
### Installing Minecraft Bedrock Edition
while [[ $INSTALL_MINECRAFT=1 ]];
do
printf "\nWould you like to install Minecraft Bedrock Edition? \n(Linux port of Android/Google Play version; Is cross-platform.)"; read yesorno
    if [[ $yesorno == "" ]]; then
        printf "\nThat is not an option. [y]yes or [n]no."
    elif [[ $yesorno == "y"* ]]; then
        printf "\nAttempting to install Minecraft Bedrock Edition...\n"
        mkdir ~/MC-bedrock/
        sudo dpkg --add-architecture i386
        sudo apt-get update
        sudo apt install curl libc6-i386 libx11-6:i386 libxext6:i386 libegl1-mesa:i386 zlib1g:i386 libstdc++6:i386 libgl1-mesa-dri:i386 libasound2:i386 libpulse0:i386
        curl -L https://github.com/ChristopherHX/linux-packaging-scripts/releases/download/appimage/Minecraft_Bedrock_Launcher-x86_64.0.0.510.AppImage --output MC.AppImage
        chmod +x MC.AppImage
        mv MC.AppImage ~/MC-bedrock/
        printf "\nNote: To run Minecraft use the command ./MC.AppImage to run the launcher in the installation directory. Will have to manually add to PATH and manually add program to menu using Alacarte. Recommend moving install location to /opt/local/ directory."
        break
    elif [[ $yesorno == "n"* ]]; then
        printf "\nNot installing Minecraft Bedrock Edition\n" && break;
    fi
done
###

### Installing ALACARTE (PLACEHOLDER)
###

### Installing Retroarch
while [[ $INSTALL_RETROARCH=1 ]];
do
printf "\nWould you like to install Retroarch? (Game Emulation & Libraries)"; read yesorno
    if [[ $yesorno == "" ]]; then
        printf "\nThat is not an option. [y]yes or [n]no."
    elif [[ $yesorno == "y"* ]]; then
        printf "\nAttempting to install Retroarch...\n"
        sudo add-apt-repository ppa:libretro/stable && sudo apt-get update && sudo apt-get install retroarch*
        break
    elif [[ $yesorno == "n"* ]]; then
        printf "\nNot installing Retroarch\n" && break;
    fi
done
###
### Installing PCSX2 (PLACEHOLDER)
###

### Installing VLC (PLACEHOLDER)
###

### Installing OBS (PLACEHOLDER)
###

### Installing SYNCTHING (PLACEHOLDER)
###

### Installing AUDACITY (PLACEHOLDER)
###

### Installing BLENDER (PLACEHOLDER)
###

### Installing VIRTUALBOX (PLACEHOLDER)
###

### Exit the script
exit
