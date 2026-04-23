#!/bin/nu

let state_file = $"($env.HOME)/.config/hypr/toggles/mousemode.state"
let config_dir = $"($env.HOME)/.config/hypr/toggles/mousemode"

if ((open $state_file --raw | str trim) != "1") {
    exit 0
}

let pos = (
    hyprctl cursorpos
    | split row ", "
    | each {|it| $it | str trim }
)

qs ipc -p $config_dir call radial showAt $pos.0 $pos.1
