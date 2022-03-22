#!/bin/bash

system(){
        echo "What Distro do you use:
        "
        echo -ne "
        1) Arch
        0) Debian/Ubuntu
        Choose an option:  " 
        read -r sys
        case sys in
        1)
        sudo pacman -S --noconfirm --needed zsh zsh-syntax-highlighting zsh-autosuggestions git curl
        ;;
        0)
        apt-get update && sudo apt-get upgrade
        apt-get -y --yes install zsh
        ;;
        *)
        echo "Please use 1 or 0"
        system
        ;;
        esac
}
    
install{
        #install zshrc
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        exit    
        #install plugins
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
        #configs        
        cp ${SCRIPT_DIR}/configs/.zshrc ~/.zshrc
        cp ${SCRIPT_DIR}/configs/starship.toml ~/.config        
        mkdir ~/.alias
        cp ${SCRIPT_DIR}/configs/aliasrc ~/.alias       
        #make default shell
        chsh -s /bin/zsh
        chsh -s /bin/zsh $USER

}

system
install