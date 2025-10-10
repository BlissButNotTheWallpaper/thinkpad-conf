#!/bin/bash

#install all packages required

packages=("i3" "kitty" "rofi" "tmux" "vim" "zsh")

printf "Updating ...\n"
sudo apt update

for package in "${packages[@]}"; do 
	printf "Installing $package ...\n"
	sudo apt install -y "$package"
done

# move all the config files to the desired directory

# lets make all the needed dirs in $HOME/.config/

dotconf_dirs=("i3" "kitty" "rofi" "tmux" "i3status")

for dotconf_dir in "${dotconf_dirs[@]}"; do
	printf "making dir ~/.config/$dotconf_dir ...\n"
	mkdir -p "$HOME/.config/$dotconf_dir"
done

# set up i3
echo "setting up i3 ..."
mv $HOME/thinkpad-conf/i3/config $HOME/.config/i3/
echo "setting up i3status ..."
mv $HOME/thinkpad-conf/i3/i3status.conf $HOME/.config/i3status/
# set up kitty
echo "setting up kitty terminal ..."
mv $HOME/thinkpad-conf/kitty/kitty.conf $HOME/.config/kitty/

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

# set up oh my szh
echo "installing oh my zsh ..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo
echo
echo "############ hey set up zsh by yourself #############"
echo
echo "$ mv $HOME/thinkpad-conf/zsh/zshrc $HOME/.zshrc"
echo
echo "#####################################################"
