#!/bin/bash

#Update packages
sudo pacman -Syu

#Install the parts
sudo pacman -S hyprland waybar wofi kitty neovim hyprlock hyprparer hyprpicker dunst wlogout firefox 

cp -r personal ~/

#Copy over the .config dir
cp -r config ~/.config

#Install omz
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#Copy over the agnoster theme
cp agnoster.zsh-theme ~/oh-my-zsh/themes/agnoster.zsh-theme

#ToDo
# manually set up neovim dependencies
