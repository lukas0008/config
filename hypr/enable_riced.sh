#!/bin/bash
ln -sfn ~/.config/hypr/riced.conf ~/.config/hypr/hyprland.conf 
if pkill waybar; then
  qs -c noctalia-shell 2>&1 1>/dev/null
fi
