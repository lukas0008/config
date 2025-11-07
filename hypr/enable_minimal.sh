#!/bin/bash
ln -sfn ~/.config/hypr/minimal.conf ~/.config/hypr/hyprland.conf 
if pkill -f "qs -c noctalia-shell"; then
  waybar 2>&1 1>/dev/null
fi
