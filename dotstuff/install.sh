#!/usr/bin/bash

packages="
git
ncdu
neovim
wget
alacritty
alacritty-themes
rofi
noctalia-shell
clang
fastfetch
brightnessctl
cowsay
legcord-bin
steam
gh
unzip
xfce-polkit"
packages="$(echo $packages | tr '\n' ' ')"
echo "Installing:
$packages"
donice "yay -S --needed --noconfirm $packages"
