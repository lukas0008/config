#!/usr/bin/bash

packages="
git
ncdu
neovim
wget
alacritty
rofi
noctalia-shell
clang
fastfetch
brightnessctl
cowsay
legcord-bin
steam
gh
unzip"
echo "Installing\n$packages"

donice "yay -S --needed --noconfirm $packages"
