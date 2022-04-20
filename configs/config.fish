
# My fish config. Not much to see here; just some pretty standard stuff.

### ADDING TO THE PATH
# First line removes the path; second line sets it.  Without the first line,
# your path gets massive and fish becomes very slow.
set -e fish_user_paths
set -U fish_user_paths $HOME/.local/bin $HOME/Applications $fish_user_paths

# Add flatpak exports to PATH
set -l xdg_data_home $XDG_DATA_HOME ~/.local/share
set -gx --path XDG_DATA_DIRS $xdg_data_home[1]/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share

for flatpakdir in ~/.local/share/flatpak/exports/bin /var/lib/flatpak/exports/bin
    if test -d $flatpakdir
        contains $flatpakdir $PATH; or set -a PATH $flatpakdir
    end
end


### EXPORT ###
set fish_greeting                                 # Supresses fish's intro message
set TERM "xterm-256color"                         # Sets the terminal type
set EDITOR "vim"                                  # $EDITOR use vim in terminal

### AUTOCOMPLETE AND HIGHLIGHT COLORS ###
set fish_color_normal brcyan
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param brcyan

### FUNCTIONS ###

# Function for git push
function gitpush # This is the function name and command we call
 	git --git-dir=$PWD/.git add . # Stage all unstaged files
	git --git-dir=$PWD/.git commit -a -m $argv # Commit files with the given argument as the commit message
	git --git-dir=$PWD/.git pull # Pull to remote
	git --git-dir=$PWD/.git push # Push to remote
end

function pack_man
	if [ -x "$(command -v apk)" ]
		alias packy='sudo apk add --no-cache '
	else if [ -x "$(command -v apt-get)" ]
		alias packy='sudo apt-get install '
		alias rpacky='sudo apt-get remove'
		alias cleanup='sudo apt-get autoremove'
		alias packdate='sudo apt-get -y update && apt-get upgrade && flatpak -y --noninteractive update'
	else if [ -x "$(command -v dnf)" ]
		alias packy='sudo dnf install '
		alias rpacky='sudo dnf remove '
		alias cleanup='sudo dnf -y autoremove'
		alias packdate='sudo dnf -y upgrade --refresh'
	else if [ -x "$(command -v zypper)" ]
		alias packy='sudo zypper install '
	else if [ -x "$(command -v yay)" ]
		alias packy="yay -S "
		alias rpacky='yay -Rdd'
		alias pacman-update='sudo pacman-mirrors --geoip'
		alias cleanup='sudo pacman -Rns (pacman -Qtdq) && yay -Yc' # Cleanup orphaned packages
		alias fixpacman="sudo rm /var/lib/pacman/db.lck"
		alias packdate='yay --noconfirm -Syu && sudo flatpak -y --noninteractive update'
		# get fastest mirrors
		alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
		alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
		alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
		alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"
	else
		echo 'This Distro is not supported!'
	end
end
pack_man

### END OF FUNCTIONS ###

alias reload='source ~/.config/fish/config.fish'

# Include all aliases
[ -f ~/.alias/aliasrc ] && source ~/.alias/aliasrc

### SETTING THE STARSHIP PROMPT ###
starship init fish | source
