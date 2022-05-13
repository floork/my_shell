#!/bin/bash

system(){
        if [[ ${sys} == "1" ]]; then
        ${pass} | sudo pacman -S --noconfirm --needed zsh curl exa
        elif [[ ${sys} == "2" ]]; then
        sudo -S dnf -y install zsh curl exa curl
        
        elif [[ ${sys} == "0" ]]; then
        ${pass} | sudo apt-get update && sudo apt-get upgrade
        ${pass} | sudo apt-get -y --yes install zsh exa
        else
          echo "Please use 1 or 0"
          system
        fi        
}
    
inst () {
        #install zshrc
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        exit    
        #install plugins
        git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
        #configs        
        cp ${SCRIPT_DIR}/configs/zshrc ~/.zshrc
        cp ${SCRIPT_DIR}/configs/starship.toml ~/.config/
        if [ -d "~/.alias/" ]; then
                cp ${SCRIPT_DIR}/configs/aliasrc ~/.alias/
        else
                mkdir ~/.alias
                cp ${SCRIPT_DIR}/configs/aliasrc ~/.alias/
        fi
        
        #make default shell
        sudo -S chsh -s /bin/zsh
}

system
inst
