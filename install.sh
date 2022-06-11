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

systems(){
          if [ -x "$(command -v pacman)" ];then
          sys=1
          elif [ -x "$(command -v dnf)" ];then
          sys=2     
          elif [ -x "$(command -v apk)" ];then
          sys=0
          elif [ -x "$(command -v apt-get)" ];then
          sys=0
          else
            echo 'This Distro is not supported!'
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
            #read -sp "Password: " pass
            case ${hel} in
            1)
            echo "installing Nerd Font"
            git clone https://github.com/ryanoasis/nerd-fonts
            cd nerd-fonts
            sudo ./install.sh
            bash ${SCRIPT_DIR}/scripts/fish.sh  
            bash ${SCRIPT_DIR}/scripts/bash.sh  
            ;;
            2)
            echo "installing Nerd Font"
            git clone https://github.com/ryanoasis/nerd-fonts
            cd nerd-fonts
            sudo ./install.sh
            bash ${SCRIPT_DIR}/scripts/zsh.sh  
            bash ${SCRIPT_DIR}/scripts/bash.sh 
            ;;
            3)
            echo "installing Nerd Font"
            git clone https://github.com/ryanoasis/nerd-fonts
            cd nerd-fonts
            sudo ./install.sh
            bash ${SCRIPT_DIR}/scripts/bash.sh  
            ;;
            0)
            #echo "installing Nerd Font"
            #git clone https://github.com/ryanoasis/nerd-fonts
            #cd nerd-fonts
            #sudo ./install.sh
            bash ${SCRIPT_DIR}/scripts/zsh.sh  
            bash ${SCRIPT_DIR}/scripts/bash.sh 
            bash ${SCRIPT_DIR}/scripts/fish.sh 
            ;;
            *)
            echo "Please only use the right numbers"
            prompt
            ;;
            esac
        }

sudoers(){
    echo "# Shutdown Reboot etc without sudo passwd" | sudo tee -a /etc/sudoers
    echo "%users  ALL=(ALL) NOPASSWD: /sbin/poweroff, /sbin/reboot, /usr/sbin/pm-suspend-hybrid" | sudo tee -a /etc/sudoers
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

test(){
  echo ${sys}
  exit
}

export SCRIPT_DIR sys pass

clear
logo
systems
sudoers
#test
prompt
logo2
