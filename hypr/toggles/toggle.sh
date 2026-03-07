#!/bin/bash
if [[ $2 -eq '1' ]]
then
    eval ln -sfn "~/.config/hypr/toggles/$1_off.conf" "~/.config/hypr/toggles/$1.conf" 
else
    eval ln -sfn "~/.config/hypr/toggles/$1_on.conf" "~/.config/hypr/toggles/$1.conf" 
fi
