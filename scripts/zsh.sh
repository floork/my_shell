#!/bin/bash

system(){
        echo "What Distro do you use:
        "
        echo -ne "
        1) Arch
        2) Fedora
        0) Debian/Ubuntu
        Choose an option:  " 
        read -r sys
        case ${sys} in
        1)
        sudo pacman -S --noconfirm --needed zsh curl exa
        ;;
        2)
        sudo dnf -y install zsh curl exa curl
        ;;
        0)
        sudo apt-get update && sudo apt-get upgrade
        sudo apt-get -y --yes install zsh exa
        ;;
        *)
        echo "Please use 1 or 0"
        system
        ;;
        esac
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
        mkdir ~/.alias
        cp ${SCRIPT_DIR}/configs/aliasrc ~/.alias/
        #make default shell
        chsh -s /bin/zsh
}

system
inst
