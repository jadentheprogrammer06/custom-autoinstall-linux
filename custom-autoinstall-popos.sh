#!/bin/bash
#
# This script is for Pop OS.
#



# help function
function show_usage () {
    printf "Usage: $0 [options [parameters]]\n"
    printf "\nOptions:\n"
    printf " -A|-a|--install-all, Installs all available software.\n"
    printf " -C|-c|--install-category [categories], Installs from provided categories. (See below.)\nNOTE: Can only install one category at the moment due to some bugs.\n"
    printf " -H|-h|--help, displays Help page with available categories."
    printf "\n\nCategories:\n web-browsing\n utilities\n image-editing\n video-editing\n gaming\n programming\n social-media\n"

    return 0
}

# array to check for which categories to install through, when argument is passed through the shell.
declare -a category_list
# checking for arguments/parameters.
while [ ! -z "$1" ]; do
  case "$1" in
     --install-all|-A|-a)
         echo "Installing all available software."
         category_list="web-browsing utilities image-editing video-editing gaming programming social-media"
         ;;
     --category|-C|-c)
         shift
         iterable=0
         for parameter in $@
         do
         case $parameter in
             web-browsing|utilities|image-editing|video-editing|gaming|programming|social-media)
                printf "\nInstalling from category $parameter\nWARNING: can not install more than one category at the moment, unless using --install-all. Sorry."
                categories_provided=1
                category_list+=" ${parameter}"
                ;;
             *)
                echo "error: $parameter is not an available category. use --help to view available categories." && exit
                ;;
         esac
         done
         [[ $1 == "" ]] && echo "error: no category provided. use --help to view available categories." && exit
         ;;
     --help|-H|-h)
        shift
        echo "Displaying help page."
        show_usage
        exit
        ;;
     *)
        [[ $categories_provided != 1 ]] && echo "error: $1 is invalid argument. use --help for available input options."
        exit
        ;;
  esac
shift
done


PromptInstall() {
RunPrompt=1
while [[ $RunPrompt == 1 ]]
do
#    if [[ $prompt_category == 1 ]] && [[ $categories_provided == 1 ]]; then
#        for parameter in $@
#        do
#        [[ $parameter == $CATEGORY ]] && category_is_same=1
#        done
#    fi
#    
    for item in $category_list
    do
        case $item in
            ${CATEGORY})
                printf "\nYou passed in this category as an argument using the shell. Installing all programs available in this category.\n"
                install_all_category=1
                ;;
        esac
    done
    
    
    [[ $install_all_category != 1 ]] && printf "\nWould you like to install $PROGRAM? \n>>>" && read yesorno || yesorno="y"
    
    if [[ $yesorno == "" ]]; then
        printf "\nThat is not an option. [y]yes or [n]no. (lowercase)"
    elif [[ $yesorno == "y"* ]]; then
        [[ $prompt_category == 1 ]] && [[ $install_all_category != 1 ]] && printf "\nPrompting you through software in ${CATEGORY}...\n" || printf "\nAttempting to install $PROGRAM...\n"
        [[ $multiplecommands != 1 ]] && $INSTALL_STEPS || $commands_function; RunPrompt=0
        [[ $prompt_category == 1 ]] && install_category=1 && RunPrompt=0
        prompt_category=0; multiplecommands=0; INSTALL_STEPS='echo'; # need to reset to 0 so it doesn't glitch out.
    elif [[ $yesorno == "n"* ]]; then
        multiplecommands=0; INSTALL_STEPS='echo';
        [[ $prompt_category == 1 ]] && printf "\nSkipping category ${CATEGORY}\n" && prompt_category=0 && RunPrompt=0 || printf "\nNot installing $PROGRAM\n" && RunPrompt=0
    fi
done
}


Main() {
[[ $1 == "" ]] && printf "\nGoing through standard wizard/prompt.\nUse --help to view help page for more options.\n"
install_category=0
prompt_category=0
# Installation steps for programs are put into categories using If loops.
# where $PROGRAM is actually a category.

printf "\nAdding flathub repository... (Ctrl-C if this is already added.)\n"
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Web-browser programs, and web-media software goes here. (Brave, Ungoogled-Chromium, Youtube-dl)
CATEGORY="web-browsing"
PROGRAM="some software in ${CATEGORY}"; prompt_category=1; PromptInstall
if [[ $install_category == 1 ]]
then
    BraveCommands() {
    sudo apt install apt-transport-https curl
    curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
    echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    sudo apt update
    sudo apt install brave-browser    
    }
    PROGRAM="Brave (Web Browser, Chromium-based with better privacy/security.)"; multiplecommands=1; commands_function=BraveCommands; PromptInstall
    ChromiumCommands() {
    echo 'deb http://download.opensuse.org/repositories/home:/ungoogled_chromium/Ubuntu_Focal/ /' | sudo tee /etc/apt/sources.list.d/home-ungoogled_chromium.list > /dev/null
    curl -s 'https://download.opensuse.org/repositories/home:/ungoogled_chromium/Ubuntu_Focal/Release.key' | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home-ungoogled_chromium.gpg > /dev/null
    sudo apt-get update
    sudo apt-get install -y ungoogled-chromium
    }
    PROGRAM="Ungoogled Chromium (Web Browser, Chromium fork with less Google.)"; multiplecommands=1; commands_function=ChromiumCommands; PromptInstall
    ytdlCommands() {
    sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
    sudo chmod a+rx /usr/local/bin/youtube-dl
    }
    PROGRAM="Youtube-dl (Program for downloading videos/audio)"; multiplecommands=1; commands_function=ytdlCommands; PromptInstall
fi
install_category=0

# "Utilties" / miscellaneous programs go here. (VLC media player, Syncthing, GIMP, Alacarte, Virtualbox, Wireshark)
CATEGORY="utilities"
PROGRAM="some software in ${CATEGORY}"; prompt_category=1; PromptInstall
if [[ $install_category == 1 ]]
then
    PROGRAM="VLC (Video/Music/DVD Player)"; INSTALL_STEPS='sudo flatpak install flathub org.videolan.VLC'; PromptInstall
    SyncthingCommands() {
    sudo apt-get install apt-transport-https
    curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
    echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
    printf "Package: *\nPin: origin apt.syncthing.net\nPin-Priority: 990\n" | sudo tee /etc/apt/preferences.d/syncthing
    sudo apt-get update
    sudo apt-get install syncthing && SYNCTHING_IS_INSTALLED=1 && break
    }
    PROGRAM="Syncthing (Can be used to Sync your files across all devices. Respects your privacy and decisions.)"; multiplecommands=1; commands_function=SyncthingCommands; PromptInstall
    PROGRAM="Alacarte (Used to create custom applications-menu icons for programs and games which do not have any by default.)"; INSTALL_STEPS='sudo apt-get install alacarte'; PromptInstall
    PROGRAM="Wireshark (Network packet scanning utility.)"; INSTALL_STEPS='sudo apt-get install wireshark'; PromptInstall
    PROGRAM="BalenaEtcher (Flash ISO files to an external drive.)"; INSTALL_STEPS='wget https://github.com/balena-io/etcher/releases/download/v1.5.102/balena-etcher-electron-1.5.102-linux-x64.zip -P ~/Downloads/'; PromptInstall
    PROGRAM="Okular (Useful PDF-viewer utility.)"; INSTALL_STEPS='sudo apt-get install okular'; PromptInstall
    PROGRAM="gscan2pdf (Converts Photos/Images to PDF.)"; INSTALL_STEPS='sudo apt-get install gscan2pdf'; PromptInstall
fi
install_category=0

# Image-Editing / Digital-Art Programs go here. (GIMP, Krita, InkScape, Pinta, Blender)
CATEGORY="image-editing"
PROGRAM="some software in ${CATEGORY}"; prompt_category=1; PromptInstall
if [[ $install_category == 1 ]]
then
    PROGRAM="GIMP (Image Editor)"; INSTALL_STEPS='flatpak install flathub org.gimp.GIMP'; PromptInstall
    PROGRAM="Krita (Image Editor, Digital Art)"; INSTALL_STEPS='flatpak install flathub org.kde.krita'; PromptInstall
    PROGRAM="InkScape (Image Editor, Digital Art)"; INSTALL_STEPS="flatpak install flathub org.inkscape.Inkscape"; PromptInstall
    PROGRAM="Pinta (Image Editor, similar to paint.net)"; INSTALL_STEPS="flatpak install flathub com.github.PintaProject.Pinta"; PromptInstall
    PROGRAM="Blender (3D Models Software)"; INSTALL_STEPS='flatpak install flathub org.blender.Blender'; PromptInstall
fi
install_category=0

# Video-Editing Programs go here. (OBS, Kdenlive, Audacity)
CATEGORY="video-editing"
PROGRAM="some software in ${CATEGORY}"; prompt_category=1; PromptInstall
if [[ $install_category == 1 ]]
then
    echo "placeholder"
fi
install_category=0

# Gaming Programs go here. (Retroarch, PCSX2, Citra, Dolphin, Minecraft Java & Bedrock, Minetest)
CATEGORY="gaming"
PROGRAM="some software in ${CATEGORY}"; prompt_category=1; PromptInstall
if [[ $install_category == 1 ]]
then
    PROGRAM="Retroarch (Retro Console/Handheld/Arcade Emulation)"; INSTALL_STEPS='flatpak install flathub org.libretro.RetroArch'; PromptInstall
    PROGRAM="Petris (Python tetris clone)"; INSTALL_STEPS="sudo apt-get install petris"; PromptInstall
fi
install_category=0

# Programming / Developer programs go here. (Vim, Python3)
CATEGORY="programming"
PROGRAM="some software in ${CATEGORY}"; prompt_category=1; PromptInstall
if [[ $install_category == 1 ]]
then
    PROGRAM="Vim code-editor"; INSTALL_STEPS='sudo apt-get install vim'; PromptInstall
    PROGRAM="Python3 programming-language"; INSTALL_STEPS='sudo apt-get install python3 python-is-python3'; PromptInstall
    
fi
install_category=0

}

Main $category_list
