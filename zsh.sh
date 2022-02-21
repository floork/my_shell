#install zshrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#install plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh//plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting

#starship theme
sh -c "$(curl -fsSL https://starship.rs/install.sh)"


echo 'export ZSH="$HOME/.oh-my-zsh"' | sudo tee ~/.zshrc
echo "" | sudo tee -a ~/.zshrc
echo "#plugins" | sudo tee -a ~/.zshrc
echo "plugins=(git zsh-syntax-highlighting zsh-autosuggestions)" | sudo tee -a ~/.zshrc
echo 'source $ZSH/oh-my-zsh.sh' | sudo tee -a ~/.zshrc
echo "" | sudo tee -a ~/.zshrc
echo "# Load aliases and shortcuts if existent." | sudo tee -a ~/.zshrc
echo '[ -f "$HOME/.zsh/aliasrc" ] && source "$HOME/.zsh/aliasrc"' | sudo tee -a ~/.zshrc
echo "" | sudo tee -a ~/.zshrc
echo "#theme" | sudo tee -a ~/.zshrc
echo 'eval $(starship init zsh)' | sudo tee -a ~/.zshrc

echo "exec zsh" | sudo tee -a ~/.bashrc

sudo mkdir ~/.zsh
sudo cp ~/zsh/aliasrc ~/.zsh

#make default shell
 chsh -s /bin/zsh
 chsh -s /bin/zsh $USER
