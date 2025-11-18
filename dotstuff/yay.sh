#!/usr/bin/bash

sudo pacman -S --needed git base-devel --noconfirm
mkdir -p /tmp/dots
cd /tmp/dots
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -fr yay
