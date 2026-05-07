#!/usr/bin/env bash

source "$HOME/.config/sketchybar/colors.sh"

# localhost:5001 が応答するか確認します。
if curl -fsS --max-time 1 http://localhost:5001 >/dev/null 2>&1; then
  LABEL="up"
  COLOR="$GREEN"
else
  LABEL="down"
  COLOR="$RED"
fi

sketchybar --set "$NAME" icon.color="$COLOR" label="$LABEL"
