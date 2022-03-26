#!/bin/bash

system(){
            echo "What Distro do you use"
            echo -ne "
            1) Arch
            0) Debian/Ubuntu
            Choose an option:  "
            read -r sys
            case ${sys} in
            1)
            sudo pacman -S --noconfirm --needed exa
            ;;
            0)
            sudo apt-get update && sudo apt-get upgrade
            sudo apt-get -y --yes install exa
            ;;
            *)
            echo "Please use 1 or 0"
            system
            ;;
            esac
}

install(){
            cp ${SCRIPT_DIR}/configs/.bashrc ~/.bashrc
            cp ${SCRIPT_DIR}/configs/starship.toml ~/.config

            mkdir ~/.alias
            cp ${SCRIPT_DIR}/configs/aliasrc ~/.alias
}

system
install
