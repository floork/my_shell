#!/bin/bash



#install zshrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#install plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh//plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting

#starship theme
git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/themes/powerlevel10k


cat cat <<EOF > ~/.zshrc
export ZSH="$HOME/.oh-my-zsh"

#plugins
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

# Load aliases and shortcuts if existent.
[ -f "$HOME/.zsh/aliasrc" ] && source "$HOME/.zsh/aliasrc"

#theme
ZSH_THEME="powerlevel10k/powerlevel10k"
EOF

echo "exec zsh" | sudo tee -a ~/.bashrc

sudo mkdir ~/.zsh
sudo cp ~/zsh/aliasrc ~/.zsh

#make default shell
 chsh -s /bin/zsh
 chsh -s /bin/zsh $USER
