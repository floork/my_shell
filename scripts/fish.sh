#!/bin/bash

system(){
    echo "What Distro do you use"
            echo -ne "
            1) Arch
            0) Debian/Ubuntu
            Choose an option:  " 
            read -r sys
            case sys in
            1)
            sudo pacman -S --noconfirm --needed fish git curl
            ;;
            0)
            apt-add-repository ppa:fish-shell/release-3 
            apt-get update && sudo apt-get upgrade
            apt-get -y --yes install fish curl
            ;;
            *)
            echo "Please use 1 or 0"
            system
            ;;
            esac
}
    
install(){

    #install Oh My Fish
    curl -L https://get.oh-my.fish | fish

    #install fisher
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
    fisher install oh-my-fish/plugin-extract

    #configs    
    mkdir -p ~/.config/fish
    cp ${SCRIPT_DIR}/configs/config.fish ~/.config/fish
    cp ${SCRIPT_DIR}/configs/starship.toml ~/.config

    if [ ${sys} == "1"]
    then
        #Make fish default
        chsh -s /usr/bin/fish
        chsh -s /usr/bin/fish $USER
    elif [ ${sys} == "0"]
    then
        chsh -s /usr/local/bin/fish
        chsh -s /usr/local/bin/fish $USER
    else 
        echo "Error"
    fi
}

system 
install