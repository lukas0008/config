#!/bin/bash

config_dir="$HOME/.config/hypr/toggles/mousemode"

if ! qs ipc -p "$config_dir" show >/dev/null 2>&1; then
    RADIAL_CONFIG=$(<"$config_dir/config.json") qs -p "$config_dir" -d >/dev/null 2>&1
fi
