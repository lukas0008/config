#!/bin/bash

config_dir="$HOME/.config/hypr/toggles/mousemode"

qs kill -p "$config_dir" >/dev/null 2>&1 || true
rm -f "$config_dir/middle-release.pid"
