#!/bin/bash

# Warna ANSI
RED='\033[5;31m'
GREEN='\033[5;32m'
YELLOW='\033[5;33m'
BLUE='\033[5;34m'
RESET='\033[0m'
PUTIH='\033[5;37m'
BLUE2='\033[5;36m'
TANYA='\033[5;37m[\033[5;33m?\033[5;37m]'
error="\033[5;37m[\033[5;31mErr!\033[5;37m]"
nrm="\033[5;37m[\033[5;36mINFO\033[5;37m]"
suc="\033[5;37m[\033[5;32mSUCCESS\033[5;37m]"

clear_screen() {
    if [ "$OS" == "nt" ]; then
        cls
    else
        clear
    fi
}

OS=$(uname -s)
if [[ "$OS" == *"NT"* ]]; then
    OS="nt"
else
    OS="posix"
fi

clear_screen

echo -e "${BLUE}╭─────────────────────────────────────────────╮${RESET}"
echo -e "${BLUE}│${RED}           Python Package Installer          ${BLUE}│${RESET}"
echo -e "${BLUE}╰─────────────────────────────────────────────╯${RESET}"

while true; do
    echo -e "
${BLUE}  _____ ______   ____  ____  ______  __ __  ____  
 / ___/|      | /    ||    \|      ||  |  ||    \ 
(   \_ |      ||  ${RED}o  ${BLUE}||  ${RED}D${BLUE}  )      ||  |  ||  ${RED}o ${BLUE} )
 \__  ||_|  |_||     ||    /|_|  |_||  |  ||   _/ 
 /  \ |  |  |  |  _  ||    \  |  |  |  :  ||  |   
 \    |  |  |  |  |  ||  .  \ |  |  |     ||  |   
  \___|  |__|  |__|__||__|\_| |__|   \__,_||__|   

${TANYA} \033[5;37mWelcome!, Please Select Installation Method \033[5;31m:
\033[5;33m │\-[ \033[5;31m1 \033[5;33m]\033[5;36m┅┅❯ \033[5;35mPIP
\033[5;33m │\-[ \033[5;31m2 \033[5;33m]\033[5;36m┅┅❯ \033[5;35mPIP2
\033[5;33m │\-[ \033[5;31m3 \033[5;33m]\033[5;36m┅┅❯ \033[5;35mPIP3
\033[5;33m │\-[ \033[5;31m4 \033[5;33m]\033[5;36m┅┅❯ \033[5;35mExit The Program
"

    echo -e -n "${TANYA} ${BLUE}Please select one of the menus above ${RED}: ${BLUE2}"
    read -r choice

    case $choice in
        1)
            INSTALL_CMD="pip"
            ;;
        2)
            INSTALL_CMD="pip2"
            ;;
        3)
            INSTALL_CMD="pip3"
            ;;
        4)
            echo -e "${nrm} ${RED}Exit The Program.${RESET}"
            exit 0
            ;;
        *)
            echo -e "${error} ${RED}Invalid Selection, please try again${RESET}"
            continue
            ;;
    esac

    echo -e -n "${nrm} ${BLUE}Starting the Installation with ${INSTALL_CMD}...${RESET}"
    echo ""
    echo -e "\033[5;32m"
    $INSTALL_CMD install requests beautifulsoup4 datetime

    if [ $? -eq 0 ]; then
        echo -e "${suc} ${GREEN}Installation Successfully!!${RESET}"
        sleep 2
        echo -e "${nrm} \033[5;37mPlease Command Next With \033[0;36mpython3 main.py"
    else
        echo -e "${error} ${RED}An error occurred during installation.. ${RESET}"
    fi
    exit 0
done
