#!/bin/bash

system(){
            if [[ ${sys} == "1" ]]; then
            ${pass} | sudo pacman -S --noconfirm --needed starship exa curl
            elif [[ ${sys} == "2" ]]; then
            sudo -S dnf -y install starship exa curl
            elif [[ ${sys} == "0" ]]; then
            ${pass} | sudo apt-get update && sudo apt-get upgrade
            ${pass} | sudo apt-get -y --yes install exa
            else
                echo "Please use 1 or 0"
                system
            fi            
}

install(){
        
        # configs
        cp ${SCRIPT_DIR}/configs/bashrc ~/.bashrc
        cp ${SCRIPT_DIR}/configs/starship.toml ~/.config

        if [ -d "~/.alias/" ]; then
                cp ${SCRIPT_DIR}/configs/aliasrc ~/.alias/
        else
                mkdir ~/.alias
                cp ${SCRIPT_DIR}/configs/aliasrc ~/.alias/
        fi

        #change shell
        sudo -S chsh -s /bin/bash
}

system
install
