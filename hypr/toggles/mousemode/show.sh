#!/bin/bash

state_file="$HOME/.config/hypr/toggles/mousemode.state"
config_dir="$HOME/.config/hypr/toggles/mousemode"

[[ $(<"$state_file") == "1" ]] || exit 0

read -r x y < <(hyprctl cursorpos | tr ',' ' ')

qs ipc -p "$config_dir" call radial showAt "$x" "$y"
