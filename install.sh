#!/bin/bash

SCRIPT_DIR="$HOME/my_shell"

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
            bash ${SCRIPT_DIR}/scripts/fish.sh  |& tee
            bash ${SCRIPT_DIR}/scripts/bash.sh  |& tee
            ;;
            2)
            bash ${SCRIPT_DIR}/scripts/zsh.sh  |& tee
            bash ${SCRIPT_DIR}/scripts/bash.sh  |& tee
            ;;
            3)
            bash ${SCRIPT_DIR}/scripts/bash.sh  |& tee
            ;;
            0)
            bash ${SCRIPT_DIR}/scripts/fish.sh  |& tee 
            bash ${SCRIPT_DIR}/scripts/zsh.sh  |& tee 
            bash ${SCRIPT_DIR}/scripts/bash.sh  |& tee 
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
