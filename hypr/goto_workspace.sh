#!/usr/bin/bash
possibles="NoiseTorch\nDiscord\nSteam"
if [[ $1 -eq "goto" ]]
then
    hyprctl dispatch togglespecialworkspace $(echo -e $possibles | tofi)
elif [[ $1 -eq "moveto" ]]
then
    hyprctl dispatch movetoworkspace special:$(echo -e $possibles | tofi)
fi

ps -eo pid,cmd | grep tofi | grep -v grep | awk '{print $1}' | xargs kill
