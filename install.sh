#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

logo (){
    echo -ne "
███╗   ███╗██╗   ██╗    ███████╗██╗  ██╗███████╗██╗     ██╗
████╗ ████║╚██╗ ██╔╝    ██╔════╝██║  ██║██╔════╝██║     ██║
██╔████╔██║ ╚████╔╝     ███████╗███████║█████╗  ██║     ██║
██║╚██╔╝██║  ╚██╔╝      ╚════██║██╔══██║██╔══╝  ██║     ██║
██║ ╚═╝ ██║   ██║       ███████║██║  ██║███████╗███████╗███████╗
╚═╝     ╚═╝   ╚═╝       ╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝
-----------------------------------------------------------------
                Welcome to my Shell install Script
-----------------------------------------------------------------
    "
}

font(){
    FONT_INSTALLED=$(fc-list | grep -i "Meslo");
    if ! [ "$FONT_INSTALLED" ]; then
        curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest \
        |   grep "Meslo.zip" \
        |   cut -d : -f 2,3 \
        |   tr -d \" \
        |   wget -qi -
        unzip Meslo.zip -d /usr/share/fonts
        # Reloading Font
        fc-cache -vf
        rm ./Meslo.zip
    else
        :
    fi
}


prompt(){
    echo -ne "
    Which Shell do you want to customize/install"
    echo -ne "
            1) Fish
            2) Zsh
            3) Bash
            0) All
    Choose an option:  "
    read -r hel
    case ${hel} in
        1)
            # install requirements
            if [ -x "$(command -v pacman)" ];then
                sudo pacman -S --noconfirm --needed fish curl exa starship
            elif [ -x "$(command -v dnf)" ];then
                sudo -S sudo dnf -y install fish curl exa starship
            elif [ -x "$(command -v apt-get)" ];then
                sudo apt-add-repository ppa:fish-shell/release-3
                sudo apt-get update && sudo apt-get upgrade
                sudo apt-get -y --yes install fish curl exa starship
            else
                echo 'This Distro is not supported!'
            fi
            #install Oh My Fish
            curl -L https://get.oh-my.fish | fish

            #install fisher
            curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
            fisher install oh-my-fish/plugin-extract
            # configs
            bash_prompt
            fish
            #make default shell
            chsh -s /bin/fish
        ;;
        2)
            # install requirements
            if [ -x "$(command -v pacman)" ];then
                sudo pacman -S --noconfirm --needed zsh curl exa
            elif [ -x "$(command -v dnf)" ];then
                sudo -S dnf -y install zsh curl exa starship
            elif [ -x "$(command -v apt-get)" ];then
                sudo apt-get update && sudo apt-get upgrade
                sudo apt-get -y --yes install zsh exa starship
            else
                echo 'This Distro is not supported!'
            fi
            #install zshrc
            sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
            exit
            # configs
            bash_prompt
            zsh
            #make default shell
            chsh -s /bin/zsh
        ;;
        3)
            # install requirements
            if [ -x "$(command -v pacman)" ];then
                sudo pacman -S --noconfirm --needed starship exa curl
            elif [ -x "$(command -v dnf)" ];then
                sudo -S dnf -y install starship exa curl
            elif [ -x "$(command -v apt-get)" ];then
                sudo apt-get update && sudo apt-get upgrade
                sudo apt-get -y --yes install exa starship
            else
                echo 'This Distro is not supported!'
            fi
            bash_prompt
            #make default shell
            chsh -s /bin/bash
        ;;
        0)
            # install requirements
            if [ -x "$(command -v pacman)" ];then
               sudo pacman -S --noconfirm --needed starship exa curl fish zsh
            elif [ -x "$(command -v dnf)" ];then
               sudo -S dnf -y install starship exa curl fish zsh
            elif [ -x "$(command -v apt-get)" ];then
               sudo apt-add-repository ppa:fish-shell/release-3
               sudo apt-get update && sudo apt-get upgrade
               sudo apt-get -y --yes install exa fish zsh starship curl
            else
               echo 'This Distro is not supported!'
            fi
            #install Oh My Fish
            curl -L https://get.oh-my.fish | fish

            #install fisher
            curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
            fisher install oh-my-fish/plugin-extract
            #install zshrc
            sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
            exit
            # configs
            bash_prompt
            fish
            zsh
            #make default shell
            chsh -s /bin/fish
        ;;
        *)
            echo "Please only use the right numbers"
            prompt
        ;;
    esac
}

bash_prompt(){
    #configs
    cp ${SCRIPT_DIR}/configs/bashrc ~/.bashrc
    cp ${SCRIPT_DIR}/configs/starship.toml ~/.config
    
    if [ -d "~/.alias/" ]; then
        cp ${SCRIPT_DIR}/configs/aliasrc ~/.alias/
    else
        mkdir ~/.alias
        cp ${SCRIPT_DIR}/configs/aliasrc ~/.alias/
    fi
}

fish(){
    #configs
    if [ -d "~/.config/fish" ]; then
        cp ${SCRIPT_DIR}/configs/config.fish ~/.config/fish
    else
        mkdir ~/.config/fish
        cp ${SCRIPT_DIR}/configs/config.fish ~/.config/fish
    fi
    
    cp ${SCRIPT_DIR}/configs/starship.toml ~/.config
    
}

zsh(){    
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
}

sudoers(){
    echo -ne "
    Do you want to add Shutdown Reboot and Suspend without sudo password: "
    echo -ne "
            1) Yes
            0) No
    Choose an option:  "
    read -r wan
    case ${wan} in
        1)
          echo "# Shutdown Reboot etc without sudo passwd" | sudo tee -a /etc/sudoers
          echo "%users  ALL=(ALL) NOPASSWD: /sbin/poweroff, /sbin/reboot, /usr/sbin/pm-suspend-hybrid" | sudo tee -a /etc/sudoers
        ;;
        0)
        ;;
        *)
            echo "Please only use the right numbers"
            prompt
        ;;
    esac
}

logo2 (){
    echo -ne "
███╗   ███╗██╗   ██╗    ███████╗██╗  ██╗███████╗██╗     ██╗
████╗ ████║╚██╗ ██╔╝    ██╔════╝██║  ██║██╔════╝██║     ██║
██╔████╔██║ ╚████╔╝     ███████╗███████║█████╗  ██║     ██║
██║╚██╔╝██║  ╚██╔╝      ╚════██║██╔══██║██╔══╝  ██║     ██║
██║ ╚═╝ ██║   ██║       ███████║██║  ██║███████╗███████╗███████╗
╚═╝     ╚═╝   ╚═╝       ╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝
-----------------------------------------------------------------
                  finished all set and done!
-----------------------------------------------------------------
    "
}

clear
logo
font
sudoers
prompt
logo2
