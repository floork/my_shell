#!/bin/bash

SCRIPT_DIR="$HOME/linux_install"

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
            Choose an option:  " 
            read -r hel
            case ${hel} in
            1)
            bash ${SCRIPT_DIR}/scripts/fish.sh  |& tee fish.log
            bash ${SCRIPT_DIR}/scripts/bash.sh  |& tee bash.log
            ;;
            2)
            bash ${SCRIPT_DIR}/scripts/zsh.sh  |& tee zsh.log
            bash ${SCRIPT_DIR}/scripts/bash.sh  |& tee bash.log
            ;;
            3)
            bash ${SCRIPT_DIR}/scripts/bash.sh  |& tee bash.log
            ;;
            0)
            ;;
            *)
            echo "Please only use 1 or 0"
            prompt
            ;;
            esac
        }

del(){
    echo -ne "
            Do you want to delete this script?"
            echo -ne "
            1) Yes, delete and reboot
            2) Yes, delete
            3) Only reboot
            0) No
            Choose an option:  " 
            read -r delt
            case ${delt} in
            1)
            rm -r ${SCRIPT_DIR}
            echo "Your System will Reboot in 5 seconds"
            sleep 5s
            reboot -h now
            ;;
            2)
            rm -r ${SCRIPT_DIR}
            ;;
            3)
            echo "Your System will Reboot in 5 seconds"
            sleep 5s
            reboot -h now
            ;;
            0)
            exit
            ;;
            *)
            echo "Please only use 1 or 0"
            del
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
del