#!/bin/bash
# RASPBERRY PI SCRIPT.

# I created a second script that will specifically 
#  install programs designed around Raspberry Pi.

### EXAMPLE CODE (for quick one-line program installs.)
#install_category=0
# Installation steps for programs are put into categories using If loops.
# Art Programs go here.
#printf "\n\nCategory: category"
#PROGRAM="by each option in category"; INSTALL_STEPS='echo'; prompt_category=1; PromptInstall
#if [[ $install_category == 1 ]]
#then
#    PROGRAM="program"; INSTALL_STEPS='sudo apt install program'; PromptInstall
#    PROGRAM="program"; INSTALL_STEPS='sudo snap install program'; PromptInstall
#fi
#install_category=0
###
### EXAMPLE CODE (for multiple-line-commands installs.)
# Programs that require more complicated installation instructions will have their commands in a custom function that will be passed into our prompt.
# $multiplecommands should be set to 1 and #commands_function should be set to your function containing proper installation instructions.
#
# ProgramCommands() {
# wget https://this-is-the-location-of-our-package/package.deb -P ~/Downloads/
# sudo dpkg -i ~/Downloads/package.deb
# }
# PROGRAM="Third party software"; multiplecommands=1; commands_function=ProgramCommands; PromptInstal
#
###



PromptInstall() {
RunPrompt=1
while [[ $RunPrompt == 1 ]]
do
printf "\nWould you like to install $PROGRAM? \n>>>"; read yesorno
    if [[ $yesorno == "" ]]; then
        printf "\nThat is not an option. [y]yes or [n]no."
    elif [[ $yesorno == "y"* ]]; then
        printf "\nAttempting to install $PROGRAM...\n"
        [[ $multiplecommands != 1 ]] && $INSTALL_STEPS || $commands_function
        [[ $prompt_category == 1 ]] && install_category=1 && RunPrompt=0 || install_category=0
        prompt_category=0; multiplecommands=0; INSTALL_STEPS='echo'; # need to reset to 0 so it doesn't glitch out.
    elif [[ $yesorno == "n"* ]]; then
        prompt_category=0; multiplecommands=0; INSTALL_STEPS='echo';
        printf "\nNot installing $PROGRAM\n" && RunPrompt=0
    fi
done
}


Main() {
install_category=0
prompt_category=0
# Installation steps for programs are put into categories using If loops.
# where $PROGRAM is actually a category.

# Recommended/Useful-Miscellaneous Programs go here. (Brave-browser, VLC media player, Syncthing, GIMP, Alacarte, Virtualbox, Wireshark)
printf "\n\nCategory: Recommended / Useful Software"
PROGRAM="by each option in Recommended/Useful Software"; prompt_category=1; PromptInstall
if [[ $install_category == 1 ]]
    echo "This is placeholder text."
then
fi
install_category=0

# Art Programs go here. (GIMP, Krita, Blender)
printf "\n\nCategory: Art"
PROGRAM="by each option in Art/Editing"; prompt_category=1; PromptInstall
if [[ $install_category == 1 ]]
then
    echo "This is placeholder text."
fi
install_category=0

# Video-Editing Programs go here. (OBS, Kdenlive, Audacity)
printf "\n\nCategory: Video-Editing Programs"
PROGRAM="by each option in Video-Editing"; prompt_category=1; PromptInstall
if [[ $install_category == 1 ]]
then
    echo "This is placeholder text."
fi
install_category=0

# Gaming Programs go here. (Retroarch, PCSX2, Citra, Dolphin, Minecraft Java & Bedrock, Minetest)
printf "\n\nCategory: Gaming"
PROGRAM="by each option in PC Gaming"; prompt_category=1; PromptInstall
if [[ $install_category == 1 ]]
then
    echo "This is placeholder text."
fi

install_category=0

# Programming / Developer programs go here. (Placeholder for later.)

}

Main

