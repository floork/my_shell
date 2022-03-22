install (){
cp ${SCRIPT_DIR}/configs/.bashrc ~/.bashrc
cp ${SCRIPT_DIR}/configs/starship.toml ~/.config

mkdir ~/.alias
cp ${SCRIPT_DIR}/configs/aliasrc ~/.alias
}

install