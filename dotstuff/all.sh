#!/usr/bin/bash

donice ()
{
  echo "+$1"
  eval "$1"
}

read -p "
Select action:
1. Copy all dotfiles
2. Install yet another yogurt
3. Install packages
4. Configure git

Default (all): " ans
if [ $ans == "" ]
then
   . ./copydots.sh
   . ./yay.sh
   . ./install.sh
   . ./git.sh
fi
case "$ans" in
  1) . ./copydots.sh;;
  2) . ./yay.sh;;
  3) . ./install.sh;;
  4) . ./git.sh;;
*) echo "That choice dont work";;
esac
