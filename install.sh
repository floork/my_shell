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
            echo "installing Nerd Font"
            git clone https://github.com/ryanoasis/nerd-fonts
            cd nerd-fonts
            sudo ./install.sh
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

export SCRIPT_DIR 

clear
logo
prompt
logo2
