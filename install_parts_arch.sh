#!/bin/bash

#Update packages
sudo pacman -Syu

#Install the parts
sudo pacman -S hyprland waybar wofi foot neovim hyprlock hyprparer hyprpicker dunst 

#Copy over the .config dir
cp -r ./.config ~/.config

#Copy over the /etc dir
sudo cp -r ./etc /etc

#Copy over the /sur dir
sudo cp -r ./usr /usr   



