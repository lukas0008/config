#!/usr/bin/env bash

# while inotifywait -e close_write ./config.jsonc ./style.css; do 
#   
#   pkill waybar
#   waybar 2>&1 1>/dev/null & disown
# done
ps -eo pid,cmd | grep waybar | grep -v grep | awk '{print $1}' | xargs kill
waybar 2>&1 1>/tmp/waybar.log &
