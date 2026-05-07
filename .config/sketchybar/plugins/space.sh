#!/usr/bin/env bash

source "$HOME/.config/sketchybar/colors.sh"

# 現在選択中のSpaceだけアクセント色を強めます。
if [ "$SELECTED" = "true" ]; then
  sketchybar --set "$NAME" icon.color="$RED" background.drawing=on background.color="$BACKGROUND_2"
else
  sketchybar --set "$NAME" icon.color="$WHITE" background.drawing=off
fi
