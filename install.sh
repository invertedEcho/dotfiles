#!/bin/sh
cp -r nvim/ ~/.config/.
cp -r awesome/ ~/.config/.
cp -r rofi/ ~/.config/.
cp -r kitty/ ~/.config/.
sudo pacman -S --needed fish git thunar rofi kitty base-devel
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
yay -S nerd-fonts-jetbrains-mono
