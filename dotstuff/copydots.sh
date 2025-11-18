#!/usr/bin/bash

donice "cp ~/.bashrc ~/.bashrc.bak"
echo "Backed up ~/.bashrc to ~/.bashrc.bak"
donice "cp .bashrc ~/.bashrc"
echo "Replaced ~/.bashrc"

