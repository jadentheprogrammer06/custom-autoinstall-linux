# custom-autoinstall-linux - Program that easily batch-installs most commonly used Linux software/utilities & PC Gaming/Emulation Software. No friction in your installation!

# Installation Instructions.
  1. **Download this repository and extract the zip archive into your home/desktop directory.**
  * ***OR git clone this repository, if you wish.***
  2. **Run this installation script:** ```./install-update-script.sh```
  
  3. **The program is now available as a terminal command: ```custom-autoinstall-linux```. Run it to install whatever you need.**
  
  4. **Keep ```install-update-script.sh``` somewhere safe if you want to use it to update or remove your local install in the future.**
  * I recommend moving ```install-update-script.sh``` to an external hard drive for convenience sake when installing the program on a new computer or fresh Ubuntu install so you can get full usage out of your devices.
  * If you know how you can manually install the program to one of your PATH directories and manually update/uninstall it as you wish.

# ABOUT

* **This program is a basic wizard that prompts the user to batch-install common third-party software and games. This makes the process much easier & saves them a lot of time in the future. Designed for new-to-linux users and power-users alike. People are free to download this and also modify/fork it to suit their needs.**

* This program is designed around stability and reliability in personal-use on **Ubuntu, AMD64 systems** alone. *How this program runs on other distros & systems might not be as reliable due to using Ubuntu-recommended package-repositories, including the snap store. In other words: **If using something other than Ubuntu & AMD64-architecture, expect bugs.***

* In the future, I may make branches or updates to this program for it to be more compatible with other systems and/or distros. (Expect to see a Raspberry Pi branch! :D ) This may also include allowing people to input their own commands and software through a csv file.


---------------------------------------------------

# *Batch Install Your Favorite Programs & Software!*
* **Brave Browser** (Much better than Chrome. One of the smoothest and most privacy-respecting secure browsers!)
* **Vim & Git** - Common Terminal Tools (*Not installed on some distros by default.*)
* **Terminator** (Plan on automating custom-terminal add-ons later on)
* **OBS, Audacity, Kdenlive** - Video Editing
* **GIMP, Krita** - Image Editors
* **Blender** - 3D Modeling
* **Syncthing** - Easily sync files between your devices. Free & Open-Source. Is more private/secure than the cloud. Highly Recommend.
* **VirtualBox** - Virtualization for running work/test environments and distro-hopping. (will be implemented later)
* **Atom, PyCharm, Emacs, VS-Code, Sublime-Text** - Common IDEs and code-editors (will be implemented later)
* **More Developer-tools and environments** (will be implemented later)
* **Networking Utilities** (will be implemented later)
# *Confusion-Free PC-Gaming & Emulation!*
* You can install common game emulator programs: 
  * **RetroArch - Emulates almost any retro/classic gaming console you need.**
  * **Dolphin - Emulates GCN/Wii.**
  * **PCSX2 - Emulates PS2.**
  * **Citra - Emulates 3DS.** (will be implemented later)
  * **EmulationStation - Launcher for all your emulators.** (will be implemented later)
* You can install Linux-supported PC gaming software:
  * **Steam - Linux PC Gaming.** (will be implemented later)
  * **Lutris / WINE - Adds more Linux support for PC Gaming.** (will be implemented later)
  * **Minecraft - Voxel Sandbox Game** - (See Below!)
* You can install open-source Linux versions of popular video games:
  * **Ltris - Linux Tetris Clone** (will be implemented later)
  * **Chocolate-DOOM - Linux DOOM Port** (will be implemented later)
* Automatically install recommended drivers and configurations. (Might be implemented later. This seems complicated)  
# You can install All Minecraft Versions and games available right on linux, including:
* **Minecraft Bedrock Edition** (Linux port of Android version, requires Play Store copy. Has Crossplatform-Play and Consistent Performance.)
* **Minecraft Java Edition for PC.** (*The original game*. Natively supported & Has Large Mod Support. No Crossplatform-play with consoles/bedrock.)
* **Free & Open-Source Minecraft clone "minetest"** (Try it out sometime. It is fairly lightweight, has some mods, and most importantly is free.)

# Known Bugs.
* Linux Mint has problems. This is because as of Linux Mint 20 the snap store and installing snap packages is disabled. Even after enabling snap it still has some problems installing. (From testing in a VM)
* ^ Similar problems will likely be found in other linux distros. Even Ubuntu-based ones.
* Anki seems to have trouble installing. I will update the installation instructions later.
