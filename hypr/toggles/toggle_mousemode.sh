#!/bin/bash

toggle_dir="$HOME/.config/hypr/toggles"
mode=$(<"$toggle_dir/mousemode.state")

if [[ "$mode" == "0" ]]; then
    ln -sfn "$toggle_dir/mousemode_on.conf" "$toggle_dir/mousemode.conf"
    printf '1\n' > "$toggle_dir/mousemode.state"
    "$toggle_dir/mousemode/start.sh"
    notify-send "Mouse mode enabled"
else
    ln -sfn "$toggle_dir/mousemode_off.conf" "$toggle_dir/mousemode.conf"
    printf '0\n' > "$toggle_dir/mousemode.state"
    "$toggle_dir/mousemode/stop.sh"
    notify-send "Mouse mode disabled"
fi
