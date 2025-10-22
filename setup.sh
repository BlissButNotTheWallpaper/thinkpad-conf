#!/bin/bash

#install all packages required

packages=("i3" "rofi" "tmux" "vim" "fzf" "cherrytree" "flameshot" "tlp")

printf "Updating ...\n"
sudo apt update

for package in "${packages[@]}"; do 
	printf "Installing $package ...\n"
	sudo apt install -y "$package"
done

# move all the config files to the desired directory

# lets make all the needed dirs in $HOME/.config/

dotconf_dirs=("i3" "rofi" "tmux" "i3status")

for dotconf_dir in "${dotconf_dirs[@]}"; do
	printf "making dir ~/.config/$dotconf_dir ...\n"
	mkdir -p "$HOME/.config/$dotconf_dir"
done

# set up i3
echo "setting up i3 ..."
mv $HOME/thinkpad-conf/i3/config $HOME/.config/i3/
echo "setting up i3status ..."
mv $HOME/thinkpad-conf/i3/i3status.conf $HOME/.config/i3status/

# set up rofi
echo "setting up rofi ..."
mv $HOME/thinkpad-conf/rofi/config.rasi $HOME/.config/rofi/

# set up tmux
echo "setting up tmux ..."
mv $HOME/thinkpad-conf/tmux/tmux.conf $HOME/.config/tmux/
mv $HOME/thinkpad-conf/tmux/fzf_cd.sh $HOME/.config/tmux/
mv $HOME/thinkpad-conf/tmux/fzf_vim.sh $HOME/.config/tmux/

# set up vim 
echo "setting up vim ..." 
mv $HOME/thinkpad-conf/vim/vimrc $HOME/.vimrc

# set up screen-scale
echo "setting up scale display ..."
sudo mv $HOME/thinkpad-conf/screen-scale/90dpi /etc/X11/Xsession.d/

echo "making .local/bin"
mkdir -p $HOME/.local/bin
mkdir -p $HOME/.local/share

# set up bashrc
echo "setting up bashrc ..."
mv $HOME/thinkpad-conf/bash/bashrc $HOME/.bashrc

# make dev dir in home

mkdir -p $HOME/dev

#set up xfce terminal 

mv $HOME/thinkpad-conf/xfce-terminal/xfce4-terminal.xml $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/
