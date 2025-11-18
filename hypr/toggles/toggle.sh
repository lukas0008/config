#!/bin/bash
if [[ $2 -eq '1' ]]
then
    eval ln -sfn "~/.config/hypr/toggles/empty.hypr" "~/.config/hypr/toggles/$1.hypr" 
else
    eval ln -sfn "~/.config/hypr/toggles/$1_impl.hypr" "~/.config/hypr/toggles/$1.hypr" 
fi
