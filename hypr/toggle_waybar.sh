if ! pkill waybar; then
  waybar 2>&1 1>/dev/null & disown
fi
