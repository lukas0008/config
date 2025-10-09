#!/bin/bash
ln -sfn $1 ~/.config/hypr/hyprland.conf 
ln -sfn $2 ~/.config/waybar/config.jsonc
ln -sfn $3 ~/.config/waybar/style.css
ps -eo pid,cmd | grep waybar | grep -v grep | awk '{print $1}' | head -n1 | xargs kill 2>/dev/null
waybar 2>&1 1>/dev/null & disown
# waybar 2>&1 1>/tmp/waybar.log &
