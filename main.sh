#!/bin/bash
if ! [ -x "$(command -v dialog)" ]; then
  echo 'Error: dialog not installed, please install that you donkey'
  echo 'Trying to auto install it enter sudo password if necessary'
    if ! [ -x "$(command -v apt)" ]; then
        echo "Oge this aint a debian machine"
    else
        echo "Debian based distro detected, installing dialog"
        sudo apt install dialog 
    fi
    if ! [ -x "$(command -v pacman)" ]; then
        echo "this aint archlinux aswell, what madness are you trying to install this on?"
    else
        sudo pacman -S dialog --noconfirm
    fi
  
fi
dialog --backtitle "crt-quickdep" --title "itl_chorus client installer" --msgbox "This installer is still in beta! Use at your own risk!" 6 58 
dialog --backtitle "crt-quickdep" --title "itl_chorus client installer" --msgbox "Please make sure that you are connected to the internet!\nOtherwise the installer will fail!" 6 60
HEIGHT=15
WIDTH=70
CHOICE_HEIGHT=4
BACKTITLE="crt-quickdep"
TITLE="itl_chorus client installer"
MENU="Choose the appropriate installer please:"

OPTIONS=(1 "Acer Netbook installer (Synfone2, Ubuntu 16, i686 binary)"
         2 "HP Desktop installer (Synfone2, Archlinux, amd64 binary)"
         3 "Compile from source and more options(todo)")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1)
            dialog --title "crt quickdep" \
            --yesno "Would you like to install Sunfone2 for i686 32bit Acer netbooks?" 7 60
            result=$?
            case $result in
            0)
            clear
            echo "Yea uhm this installer hasent been finished lol sucks to be you I guess"
            sudo apt update
            sudo apt install wget alsa pulseaudio libasound2-dev unzip
            cd ~||exit
            wget https://512mb.org/files/itl_chorus/bin/acer-client-32bit.zip
            unzip ./acer-client-32bit.zip
            touch .profile
            mv ./.profile ./.profile-backup
            
            ;;
            1)     dialog --title "Installation canceled" --msgbox "Okay uhm great i guess?" 5 40;clear ;;
            255)   echo "Action Cancelled – Presssed [ESC] key.";;
            esac
            echo "Binary Acer netbook installer (i686 32bit)"
            ;;
        2)
            dialog --title "crt quickdep" \
            --yesno "Would you like to install Synfone2 for 64bit HP desktops)" 7 60
            result=$?
            case $result in
            0)
            clear
            echo "Starting installer, please dont touch your damn keyboard!"
            echo "You will be prompted for your sudo password, so i hope your account is a sudoer bruh"
            echo "Also you wont get any audio if your using pipewire as of now, so use pulse"
            echo "Please make sure that you are connected to the internet! Otherwise this garbage will crash lol"
            sleep 10
            cd ~ ||exit
            sudo pacman -Syyy
            sudo pacman -S rust unzip pulseaudio-alsa
            wget https://512mb.org/files/itl_chorus/bin/hp-client-64bit.zip
            unzip ./hp-client-64bit.zip
            cd ./hp-client-64bit ||exit
            chmod a+x synfone
            echo "installation complete, well the basic one atleast. Autosignon and autostarts will be added later (tm) to this installer!"
            dialog --title "crt quickdep" \
            --yesno "Would you like to configure autostart? (Press no to test run synfone2 and ESC to exit)" 7 60
            autostart=$?
            case $autostart in
            0)
                clear #todo
                ;;
            1)
                clear #todo
                ;;
            255)
                clear #todo
                ;;
            esac
            ;;
            1)     dialog --title "Installation canceled" --msgbox "Okay uhm great i guess?" 5 40;clear ;;
            255)   echo "Action Cancelled – Presssed [ESC] key.";;
            esac
            echo "Binary HP desktop installer (amd64 64bit) Your installation should be done as of now id say lol."
            ;;
        3)
            dialog --title "crt quickdep" \
            --yesno "Would you like to install the base workstation package?" 7 60
            result=$?
            case $result in
            0)     clear; echo it worked;;
            1)     dialog --title "Installation canceled" --msgbox "Okay uhm great i guess?" 5 40;clear ;;
            255)   echo "Action Cancelled – Presssed [ESC] key.";;
            esac
            echo "You chose compile from source"
            ;;
esac
