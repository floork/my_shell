#!/bin/bash

system(){
            echo "What Distro do you use"
            echo -ne "
            1) Arch
            2) Fedora
            0) Debian/Ubuntu
            Choose an option:  "
            read -r sys
            case ${sys} in
            1)
            sudo pacman -S --noconfirm --needed starship exa
            yay -S --noconfirm --needed nerd-fonts-complete-starship
            ;;
            2)
            sudo dnf -y install starship exa
            git clone https://github.com/ryanoasis/nerd-fonts
            cd nerd-fonts
            sudo ./install.sh
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
            cp ${SCRIPT_DIR}/configs/bashrc ~/.bashrc
            cp ${SCRIPT_DIR}/configs/starship.toml ~/.config

            mkdir ~/.alias
            cp ${SCRIPT_DIR}/configs/aliasrc ~/.alias

            chsh -s /usr/bin/fish
            chsh -s /usr/bin/fish $USER
}

system
install
