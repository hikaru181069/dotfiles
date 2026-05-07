#!/usr/bin/env bash

# Left-most brand/menu anchor.
apple=(
  icon="$APPLE"
  icon.font="$FONT:Bold:18.0"
  icon.color="$BLUE"
  label.drawing=off
  padding_left=6
  padding_right=10
  background.color="$BACKGROUND_1"
  background.border_color="$BACKGROUND_2"
  background.border_width=2
)

sketchybar --add item apple left \
           --set apple "${apple[@]}"
