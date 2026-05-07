#!/usr/bin/env bash

source "$HOME/.config/sketchybar/colors.sh"

# Docker daemonに接続できるか確認します。
if command -v docker >/dev/null 2>&1 && docker info >/dev/null 2>&1; then
  LABEL="up"
  COLOR="$GREEN"
else
  LABEL="down"
  COLOR="$GREY"
fi

sketchybar --set "$NAME" icon.color="$COLOR" label="$LABEL"
