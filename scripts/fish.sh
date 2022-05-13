#!/bin/bash

system(){
            if [[ ${sys} == "1" ]]; then
            ${pass} | sudo pacman -S --noconfirm --needed fish curl exa
            elif [[ ${sys} == "2" ]]; then
            sudo -S sudo dnf -y install fish curl exa
            elif [[ ${sys} == "0" ]]; then
            ${pass} | sudo apt-add-repository ppa:fish-shell/release-3
            ${pass} | sudo apt-get update && sudo apt-get upgrade
            ${pass} | sudo apt-get -y --yes install fish curl exa
            else
                echo "Please use 1 or 0"
                system
            fi
}
    
install(){

    #install Oh My Fish
    curl -L https://get.oh-my.fish | fish

    #install fisher
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
    fisher install oh-my-fish/plugin-extract

    #configs    
    mkdir -p 
    if [ -d "~/.config/fish" ]; then
                cp ${SCRIPT_DIR}/configs/config.fish ~/.config/fish
        else
                mkdir ~/.config/fish
                cp ${SCRIPT_DIR}/configs/config.fish ~/.config/fish
        fi
    
    cp ${SCRIPT_DIR}/configs/starship.toml ~/.config

    #change shell
    sudo -S chsh -s /bin/fish
}

system
install
