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
#
# * I plan on adding support for users to add in their own configs to automatically install. Would likely be done through a basic csv text or config file.
#  * Alternatively, people are welcome to fork this code for their own usage. Add what is needed and works for you. Remove what doesn't. :) 
#
###

### Default Boolean Variables for each Software.
INSTALL_BRAVE=0
INSTALL_YOUTUBEDL=0 # placeholder
INSTALL_LIBREOFFICE=0 # placeholder, not added yet since Ubuntu should install it anyway. This is for those who choose minimal installation.

# placeholders, Evernote alternatives
INSTALL_SIMPLENOTE=0
INSTALL_JOPLIN=0
INSTALL_LAVERNA=0

INSTALL_GIMP=0
INSTALL_KRITA=0

INSTALL_VIRTUALBOX=0 # placeholder
INSTALL_ANKI=0 # placeholder

INSTALL_MINECRAFT=0
INSTALL_MINETEST=0
INSTALL_RETROARCH=0
INSTALL_PCSX2=0
INSTALL_CITRA=0
INSTALL_DOLPHIN=0
INSTALL_STEAM=0
INSTALL_LUTRIS=0
INSTALL_DOOM=0
INSTALL_TETRIS=0
INSTALL_EMULATIONSTATION=0

INSTALL_OKULAR=0 # placeholder
INSTALL_OBS=0
INSTALL_KDENLIVE=0 # placeholder
INSTALL_BLENDER=0
INSTALL_AUDACITY=0
INSTALL_VLC=0
INSTALL_SYNCTHING=0

INSTALL_ALACARTE=0

INSTALL_TERMINATOR=0
INSTALL_VIM=0
INSTALL_GIT=0

# placeholders, code editors and IDEs
INSTALL_ATOM=0
INSTALL_PYCHARM=0 
INSTALL_EMACS=0
INSTALL_VSCODE=0
INSTALL_SUBLIMETEXT=0

# placeholders, networking utilities
INSTALL_WIRESHARK=0
INSTALL_PINGTOTEXT=0
INSTALL_TRACEROUTE=0
# placeholders, package managers
INSTALL_SNAP=0
INSTALL_FLATPAK=0
# These are not planned to be enabled/added at the moment. Properietory garbage / potential spyware. You can still use web verisons anyways. Recommend installing in VM instead.
INSTALL_DISCORD=0
INSTALL_SPOTIFY=0


SYNCTHING_IS_INSTALLED=0
### Default Flag Variables for each Category.
FLAG_INSTALL_ALL=0
FLAG_INSTALL_GAME=0
FLAG_INSTALL_EMULATOR=0
FLAG_INSTALL_DEVELOPMENT=0
FLAG_INSTALL_VIDEO=0
FLAG_INSTALL_IMAGE=0
FLAG_INSTALL_NETWORKING=0
FLAG_INSTALL_RECOMMENDED=0
### Creating Categorized Indexed-Arrays (or "Lists" in other languages) for each program's boolean variable value. These arrays will be iterated through to enable each Boolean Variable.
games_array=($INSTALL_RETROARCH $INSTALL_MINECRAFT $INSTALL_MINETEST $INSTALL_STEAM $INSTALL_PCSX2 $INSTALL_DOLPHIN $INSTALL_CITRA $INSTALL_LUTRIS $INSTALL_DOOM $INSTALL_TETRIS $INSTALL_ALACARTE $INSTALL_EMULATIONSTATION)
emulators_array=($INSTALL_RETROARCH $INSTALL_PCSX2 $INSTALL_DOLPHIN $INSTALL_CITRA $INSTALL_TETRIS $INSTALL_DOOM $INSTALL_EMULATIONSTATION)
videos_array=($INSTALL_OBS $INSTALL_KDENLIVE $INSTALL_AUDACITY $INSTALL_VLC)
images_array=($INSTALL_GIMP $INSTALL_KRITA $INSTALL_VLC)
networking_array=($INSTALL_WIRESHARK $INSTALL_PINGTOTEXT $INSTALL_TRACEROUTE)
development_array=($INSTALL_TERMINATOR $INSTALL_VIM $INSTALL_GIT $INSTALL_ATOM $INSTALL_PYCHARM $INSTALL_EMACS $INSTALL_VSCODE $INSTALL_SUBLIMETEXT)
recommended_array=($INSTALL_BRAVE $INSTALL_GIMP $INSTALL_VLC $INSTALL_YOUTUBEDL $INSTALL_SYNCTHING $INSTALL_ANKI $INSTALL_OKULAR $INSTALL_LIBREOFFICE)
###
### FUNCTIONS : CHECK FOR FLAGS/CATEGORIES TO INSTALL
function check_for_options()
{
# FUNCTION : DISPLAY OPTIONS
function options_menu()
{
    printf "      Usage : $0 [<flag>]\n\n    FLAG        OPTIONS/INSTRUCTIONS\n\n    [-A or no-flags-supplied <Prompts installs for all available programs.>]\n    [-E <Prompts installs for all available game-emulation software.>]\n    [-G <Prompts install for all available gaming software.>]\n    [-D <Prompts installs for all development/coding software.>]\n    [-V <Prompts installs for all available video-editing software.>]\n    [-I <Prompts installs for all available image-editing software.>]\n    [-N <Prompts installs for all available networking utility software.>]\n    [-R <Prompts installs for recommended software that everyone should have installed.>]\n    [-h <Display this Menu for help.]\n\n"
}

FLAGS_USED=0 # boolean checks if flags are used.

#If you specify <flag>: with colon it needs parameter.
while getopts AGEDVINRh parm ; do
case $parm in
    A)
        echo "Category selected: All available software."
        FLAGS_USED=1
        FLAG_INSTALL_ALL=0
        ;;
    G)
        echo "Category selected: All available gaming software."
        FLAGS_USED=1
        FLAG_INSTALL_GAME=0
        ;;
    E)
        echo "Category selected: All available game-emulation software."
        FLAG_INSTALL_EMULATOR=0
        FLAGS_USED=1
        ;;
    D)
        echo "Category selected: All available development/coding software."
        FLAG_INSTALL_DEVELOPMENT=0
        FLAGS_USED=1
        ;;
    V)
        echo "Category selected: All available video-editing software."
        FLAG_INSTALL_VIDEO=0
        FLAGS_USED=1
        ;;
    I)
        echo "Category selected: All available image-editing software."
        FLAG_INSTALL_IMAGE=0
        FLAGS_USED=1
        ;;
    N)
        echo "Category selected: All available networking utility software."
        FLAG_INSTALL_NETWORKING=0
        FLAGS_USED=1
        ;;
    R)
        echo "Category selected: Recommended computer software to install."
        FLAG_INSTALL_RECOMMENDED=0
        FLAGS_USED=1
        ;;
    h)
        options_menu
        ;;
    *)
        options_menu
        echo "Invalid Option. Try again."
esac
done

if [[ $1 == '' ]]; then
options_menu
printf "\n\n    No flags supplied. We assume you want to prompt through all software."
printf "\n\n        ENTER to continue. Ctrl-Z to Exit.\n" && read
fi

if [[ $FLAGS_USED == 1 ]]; then
printf "\n\n    Flags supplied. Would you like to prompt through selected software categories?\n\n        ENTER to continue. Ctrl-Z to Exit.\n" && read
fi

shift $((OPTIND-1))

}

check_for_options # ran on start

# FUNCTION : ENABLING INSTALLATION PROMPTS BY SELECTED CATEGORIES

enabling_prompts() {





}

###### PROMPTING/INSTALLATION CODE. - May modify later for cleaner code. This is simple & works.


### Installing Snap. [PLACEHOLDER]

###

### Installing Flatpak. [PLACEHOLDER]

###

### Installing Brave browser.
while [[ $INSTALL_BRAVE == 1 ]]
do
printf "\nWould you like to install Brave? (Better Chrome web-browser with more Privacy/Security)\n>>>"; read yesorno
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
while [[ $INSTALL_VIM == 1 ]]
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
while [[ $INSTALL_GIT == 1 ]]
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
while [[ $INSTALL_GIMP == 1 ]]
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
while [[ $INSTALL_KRITA == 1 ]]
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
while [[ $INSTALL_ANKI == 1 ]]
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
while [[ $INSTALL_MINETEST == 1 ]]
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
while [[ $INSTALL_MINECRAFT == 1 ]]
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
while [[ $INSTALL_ALACARTE == 1 ]]
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
while [[ $INSTALL_MINECRAFT == 1 ]]
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
while [[ $INSTALL_RETROARCH == 1 ]]
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
while [[ $INSTALL_PCSX2 == 1 ]]
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

while [[ $INSTALL_DOLPHIN == 1 ]]
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
while [[ $INSTALL_VLC == 1 ]]
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
while [[ $INSTALL_OBS == 1 ]]
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

while [[ $INSTALL_SYNCTHING == 1 ]]
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
while [[ $INSTALL_AUDACITY == 1 ]]
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
while [[ $INSTALL_BLENDER == 1 ]]
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
while [[ $INSTALL_TERMINATOR == 1 ]]
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
while [[ $SYNCTHING_IS_INSTALLED == 1 ]]
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
