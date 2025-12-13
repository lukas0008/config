#!/usr/bin/bash
skip="false"



output=$(timeout 0.1s evtest "/dev/input/event19" 2>/dev/null | cat)

possibles="NoiseTorch\nDiscord\nSteam"

value=""
if echo "$output" | grep -F 'type 1 (EV_KEY), code 125 (KEY_LEFTMETA), value 0'
then
    if [[ $skip -eq "false" ]]
    then
        value="magic"
    else
        exit
    fi
else
    value=$(echo -e $possibles | tofi)
fi


if [[ $value -eq "" ]]
then
    value="magic"
fi


if [[ $1 -eq "goto" ]]
then
    hyprctl dispatch togglespecialworkspace $value
elif [[ $1 -eq "moveto" ]]
then
    hyprctl dispatch movetoworkspace special:$value
fi

ps -eo pid,cmd | grep tofi | grep -v grep | awk '{print $1}' | xargs kill
