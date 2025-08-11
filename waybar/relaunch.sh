#!/usr/bin/env bash

ps -eo pid,cmd | grep waybar | grep -v grep | awk '{print $1}' | xargs kill
waybar 2>&1 | tee -a /tmp/waybar.log &
disown
