#!/bin/bash

### ABOUT
# May be modified to be compatible with more system architectures \
#  and/or different linux distros and package managers.
# In my case, I designed this for modern Ubuntu(-based) linux systems \
#  running on AMD64. (I am most likely to use Ubuntu & Ubuntu is popular.)
# Should also work on Debian and Mint. Be aware that this program uses Snap,
#  for those unfond of the Snap Store. This is for software-stability purposes.
# Installing some programs may be different on Debian.
# Obviously, Arch-based distros aren't going to work with this.
#
# *In the future the user may be given more options for which package-managers they wish to use.
#  *Right now both apt and snap are being used. Again, this can be modified to suit your needs.
#
###

### *NOTE:
# For the future:
# *I may decide to implement CLI args/flags.
#
# Plan on using associative array for this to automate parts into apt-get functions where I wouldn't normally use unique commands.
# Because of unique installation instructions needed for some programs I decided to just keep it simple.
# 
# *I plan on adding support for users to add in their own configs to automatically install. Would likely be done through a basic text or config file.
#  *Alternatively, people are welcome to fork this code for their own usage. Add what is needed and works for you. Remove what doesn't. :)
# 
# *Variables are to be treated like Boolean values. Later on when we implement args and flags they may prove useful.
#
# *Variable Boolean functionality in While loops may be bugged; If you try changing the value the code will still run as normally. 
#  *It is more so treated as a design choice for future-iterations so the program can structurally code without rewriting everything.
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
INSTALL_TERMINATOR=1
INSTALL_DOLPHIN=1
INSTALL_VIM=1
INSTALL_GIT=1
INSTALL_SNAP=1
INSTALL_FLATPAK=1
SYNCTHING_IS_INSTALLED=0
### Flag Variables [PLACEHOLDER]
FLAG_INSTALL_GAMES=1
FLAG_INSTALL_VIDEOEDITORS=1
FLAG_INSTALL_DEVTOOLS=1
FLAG_INSTALL_PHOTOEDITORS=1
FLAG_INSTALL_ALL=1
FLAG_INSTALL_WEB=1
FLAG_INSTALL_PACKAGEMANAGERS=1
###

### Installing Snap. [PLACEHOLDER]

###

### Installing Flatpak. [PLACEHOLDER]

###

### Installing Brave browser.
while [[ $INSTALL_BRAVE=1 ]]
do
printf "\nWould you like to install Brave? (Better Chrome with more Privacy/Security)\n>>>"; read yesorno
    if [[ $yesorno == "" ]]; then
        printf "\nThat is not an option. [y]yes or [n]no."
    elif [[ $yesorno == "y"* ]]; then
        printf "\nAttempting to install brave-browser...\n"
        sudo apt install apt-transport-https curl
        curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
        echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
        sudo apt update
        sudo apt install brave-browser && break
    elif [[ $yesorno == "n"* ]]; then
        printf "\nNot installing brave-browser" && break;
    fi
done
###
### Installing VIM
while [[ $INSTALL_VIM=1 ]]
do
printf "\nWould you like to install Vim? (Terminal Code-Editor program. Very useful for aspiring programmers and power-users alike.)\n>>>"; read yesorno
    if [[ $yesorno == "" ]]; then
        printf "\nThat is not an option. [y]yes or [n]no."
    elif [[ $yesorno == "y"* ]]; then
        printf "\nAttempting to install Vim...\n"
        sudo apt install vim && break
    elif [[ $yesorno == "n"* ]]; then
        printf "\nNot installing Vim\n" && break;
    fi
done
###
### Installing GIT
while [[ $INSTALL_GIT=1 ]]
do
printf "\nWould you like to install Git? \n(Most popular version-control system for programmers. If running Linux Mint and planning to program you should install this. This is only if your distro does not have git installed by default.)\n>>>"; read yesorno
    if [[ $yesorno == "" ]]; then
        printf "\nThat is not an option. [y]yes or [n]no."
    elif [[ $yesorno == "y"* ]]; then
        printf "\nAttempting to install Git...\n"
        sudo apt install git && break
    elif [[ $yesorno == "n"* ]]; then
        printf "\nNot installing Git\n" && break;
    fi
done
###
### Installing GIMP
while [[ $INSTALL_GIMP=1 ]]
do
printf "\nWould you like to install GIMP? (Image Editor)\n>>>"; read yesorno
    if [[ $yesorno == "" ]]; then
        printf "\nThat is not an option. [y]yes or [n]no."
    elif [[ $yesorno == "y"* ]]; then
        printf "\nAttempting to install GIMP...\n"
        sudo apt install gimp && break
    elif [[ $yesorno == "n"* ]]; then
        printf "\nNot installing GIMP\n" && break;
    fi
done
###
### Installing Krita
while [[ $INSTALL_KRITA=1 ]]
do
printf "\nWould you like to install Krita? (Image Editor)\n>>>"; read yesorno
    if [[ $yesorno == "" ]]; then
        printf "\nThat is not an option. [y]yes or [n]no."
    elif [[ $yesorno == "y"* ]]; then
        printf "\nAttempting to install Krita...\n"
        sudo snap install krita && break
    elif [[ $yesorno == "n"* ]]; then
        printf "\nNot installing Krita\n" && break;
    fi
done
###
cd ~
### Installing Anki
while [[ $INSTALL_ANKI=1 ]]
do
printf "\nWould you like to install Anki? (Useful for Studying; Flash Cards)\n>>>"; read yesorno
    if [[ $yesorno == "" ]]; then
        printf "\nThat is not an option. [y]yes or [n]no."
    elif [[ $yesorno == "y"* ]]; then
        printf "\nAttempting to install Anki...\n"
        sudo apt install make && wget https://github.com/ankitects/anki/releases/download/2.1.28/anki-2.1.28-linux-amd64.tar.bz2 -P ~/Downloads/ && tar xjf ~/Downloads/anki-2.1.28-linux-amd64.tar.bz2 && cd anki-2.1.26-linux-amd64 && sudo make install && break
    elif [[ $yesorno == "n"* ]]; then
        printf "\nNot installing Anki\n" && break;
    fi
done
###
### Installing Minetest
while [[ $INSTALL_MINETEST=1 ]]
do
printf "\nWould you like to install Minetest? (Free & Open-Source Minecraft Clone)\n>>>"; read yesorno
    if [[ $yesorno == "" ]]; then
        printf "\nThat is not an option. [y]yes or [n]no."
    elif [[ $yesorno == "y"* ]]; then
        printf "\nAttempting to install Minetest...\n"
        sudo snap install minetest && break
    elif [[ $yesorno == "n"* ]]; then
        printf "\nNot installing Minetest\n" && break;
    fi
done
###
### Installing Minecraft Bedrock Edition
while [[ $INSTALL_MINECRAFT=1 ]]
do
printf "\nWould you like to install Minecraft Bedrock Edition? \n(Linux port of Android. Requires copy of Google Play version; Is cross-platform compatible with Microsoft/Xbox Account.)\n>>>"; read yesorno
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

### Installing Alacarte
while [[ $INSTALL_ALACARTE=1 ]]
do
printf "\nWould you like to install Alacarte? \n(Used to easily add executables to the home menu. This includes making a home menu shortcut for Minecraft Bedrock Edition.)\n>>>"; read yesorno
    if [[ $yesorno == "" ]]; then
        printf "\nThat is not an option. [y]yes or [n]no."
    elif [[ $yesorno == "y"* ]]; then
        printf "\nAttempting to install Alacarte...\n"
        sudo apt install alacarte && break
    elif [[ $yesorno == "n"* ]]; then
        printf "\nNot installing Alacarte\n" && break;
    fi
done
###

### Installing Minecraft Java (PC) Edition
while [[ $INSTALL_MINECRAFT=1 ]]
do
printf "\nWould you like to install Minecraft Java Edition? \n(Original MC Version, Native on Linux. Requires Mojang/Minecraft Account.)\n>>>"; read yesorno
    if [[ $yesorno == "" ]]; then
        printf "\nThat is not an option. [y]yes or [n]no."
    elif [[ $yesorno == "y"* ]]; then
        printf "\nAttempting to install Minecraft Java Edition...\n".
        sudo apt install default-jre #Need to install java runtime environment dependency.
        sudo apt-get --fix-missing
        sudo apt-get install -f
        wget https://launcher.mojang.com/download/Minecraft.deb -P ~/Desktop/ && sudo dpkg -i ~/Desktop/Minecraft.deb && break
    elif [[ $yesorno == "n"* ]]; then
        printf "\nNot installing Minecraft Java Edition\n" && break;
    fi
done
###

### Installing Retroarch
while [[ $INSTALL_RETROARCH=1 ]]
do
printf "\nWould you like to install Retroarch? (Game Emulation & Libraries)\n>>>"; read yesorno
    if [[ $yesorno == "" ]]; then
        printf "\nThat is not an option. [y]yes or [n]no."
    elif [[ $yesorno == "y"* ]]; then
        printf "\nAttempting to install Retroarch...\n"
        sudo add-apt-repository ppa:libretro/stable
        sudo apt-get update
        sudo apt-get install retroarch && break
    elif [[ $yesorno == "n"* ]]; then
        printf "\nNot installing Retroarch\n" && break;
    fi
done

###

### Installing PCSX2
while [[ $INSTALL_PCSX2=1 ]]
do
printf "\nWould you like to install PCSX2 Emulator? (Emulator for PlayStation2 games.)\n>>>"; read yesorno
    if [[ $yesorno == "" ]]; then
        printf "\nThat is not an option. [y]yes or [n]no."
    elif [[ $yesorno == "y"* ]]; then
        printf "\nAttempting to install PCSX2... \n(Note: this compiles from source so it could take a while depending on your PC.)\n"
	sudo snap install cmake
        sudo apt remove gcc-9 g++-9
        sudo apt install cmake g++-10-multilib \
	        libwxgtk3.0-gtk3-dev:i386 libgtk-3-dev:i386 \
	        libaio-dev:i386 libasound2-dev:i386 liblzma-dev:i386 \
	        libsdl2-dev:i386 libsoundtouch-dev:i386 \
	        libxml2-dev:i386 libpcap0.8-dev:i386

        sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10 10
        sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-10 10
        sudo update-alternatives --install /usr/bin/cc  cc  /usr/bin/gcc 30
        sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++ 30
	cd ~
        git clone https://github.com/PCSX2/pcsx2.git
        cd ~/pcsx2
	mkdir build
	cd build

        cmake -DCMAKE_TOOLCHAIN_FILE=cmake/linux-compiler-i386-multilib.cmake -DCMAKE_BUILD_TYPE=Release \
	        -DBUILD_REPLAY_LOADERS=TRUE -DCMAKE_BUILD_PO=FALSE -DGTK3_API=TRUE ..
	        
        make -j10
        make install
        cd ../bin
        break
    elif [[ $yesorno == "n"* ]]; then
        printf "\nNot installing PCSX2\n" && break;
    fi
done
###

### Installing Dolphin Emulator

while [[ $INSTALL_DOLPHIN=1 ]]
do
printf "\nWould you like to install Dolphin Emulator? (Emulator for GameCube & Wii games.)\n>>>"; read yesorno
    if [[ $yesorno == "" ]]; then
        printf "\nThat is not an option. [y]yes or [n]no."
    elif [[ $yesorno == "y"* ]]; then
        printf "\nAttempting to install Dolphin...\n"
        sudo apt-add-repository ppa:dolphin-emu/ppa
        sudo apt update
        sudo apt install dolphin-emu && break
    elif [[ $yesorno == "n"* ]]; then
        printf "\nNot installing Dolphin\n" && break;
    fi
done

###



### Installing VLC
while [[ $INSTALL_VLC=1 ]]
do
printf "\nWould you like to install VLC? (Popular Media Player)\n>>>"; read yesorno
    if [[ $yesorno == "" ]]; then
        printf "\nThat is not an option. [y]yes or [n]no."
    elif [[ $yesorno == "y"* ]]; then
        printf "\nAttempting to install VLC...\n"
        sudo snap install vlc && break
    elif [[ $yesorno == "n"* ]]; then
        printf "\nNot installing VLC\n" && break;
    fi
done
###
cd ~
### Installing OBS
while [[ $INSTALL_OBS=1 ]]
do
printf "\nWould you like to install OBS? (Popular Video Editing & Streaming Software)\n>>>"; read yesorno
    if [[ $yesorno == "" ]]; then
        printf "\nThat is not an option. [y]yes or [n]no."
    elif [[ $yesorno == "y"* ]]; then
        printf "\nAttempting to install OBS...\n"
        sudo apt install ffmpeg
        sudo add-apt-repository ppa:obsproject/obs-studio
        sudo apt install obs-studio
        break
    elif [[ $yesorno == "n"* ]]; then
        printf "\nNot installing OBS\n" && break;
    fi
done
###

### Installing Syncthing

while [[ $INSTALL_SYNCTHING=1 ]]
do
printf "\nWould you like to install Syncthing? \n(Useful software to sync data between your devices. Open-Source, Free, and Secure P2P connection. This is probably a better & private option than using proprietory cloud-backup services.)\n>>>"; read yesorno
    if [[ $yesorno == "" ]]; then
        printf "\nThat is not an option. [y]yes or [n]no."
    elif [[ $yesorno == "y"* ]]; then
        printf "\nAttempting to install Syncthing...\n"
        sudo apt-get install apt-transport-https
        curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
        echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
        sudo apt-get update
        sudo apt-get install syncthing && SYNCTHING_IS_INSTALLED=1 && break
    elif [[ $yesorno == "n"* ]]; then
        printf "\nNot installing Syncthing\n" && break;
    fi
done

###

### Installing Audacity
while [[ $INSTALL_AUDACITY=1 ]]
do
printf "\nWould you like to install Audacity? \n(Audio-recording and Audio-editing software. Useful for video editors, content creators, sound-designers, and musicians alike.)\n>>>"; read yesorno
    if [[ $yesorno == "" ]]; then
        printf "\nThat is not an option. [y]yes or [n]no."
    elif [[ $yesorno == "y"* ]]; then
        printf "\nAttempting to install Audacity...\n"
        sudo snap install audacity && break
    elif [[ $yesorno == "n"* ]]; then
        printf "\nNot installing Audacity\n" && break;
    fi
done
###

### Installing Blender
while [[ $INSTALL_BLENDER=1 ]]
do
printf "\nWould you like to install Blender? \n(Used for 3D Modeling. Probably useful for gamedevs & graphical design artists.)\n>>>"; read yesorno
    if [[ $yesorno == "" ]]; then
        printf "\nThat is not an option. [y]yes or [n]no."
    elif [[ $yesorno == "y"* ]]; then
        printf "\nAttempting to install Blender...\n"
        sudo snap install blender && break
    elif [[ $yesorno == "n"* ]]; then
        printf "\nNot installing Blender\n" && break;
    fi	
done
###

### Installing Terminator
while [[ $INSTALL_TERMINATOR=1 ]]
do
printf "\nWould you like to install Terminator? (Terminal Emulator with some useful settings.)\n>>>"; read yesorno
    if [[ $yesorno == "" ]]; then
        printf "\nThat is not an option. [y]yes or [n]no."
    elif [[ $yesorno == "y"* ]]; then
        printf "\nAttempting to install Terminator...\n"
        sudo apt install terminator && break
    elif [[ $yesorno == "n"* ]]; then
        printf "\nNot installing Terminator\n" && break;
    fi
done
###

### Installing VIRTUALBOX (PLACEHOLDER)
###


### Ask User if they want to launch Syncthing. This is useful for new installs on devices. By running it at the same time as installing programs you "kill two birds with one stone".
while [[ $SYNCTHING_IS_INSTALLED=1 ]]
do
printf "\n\nAlmost Done. We think you installed Syncthing through this script. Would you like to launch syncthing to get your file syncing done with?\n>>>"; read yesorno
    if [[ $yesorno == "" ]]; then
        printf "\nThat is not an option. [y]yes or [n]no."
    elif [[ $yesorno == "y"* ]]; then
        printf "\Launching Syncthing... CTRL-Z to exit.\n"
        syncthing
        break
    elif [[ $yesorno == "n"* ]]; then
        printf "\nNot launching Syncthing.\n" && break;
    fi
done


### Exit the script
exit
