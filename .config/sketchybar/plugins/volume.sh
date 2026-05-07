#!/usr/bin/env bash

source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

# システム音量を表示します。
VOLUME=$(osascript -e 'output volume of (get volume settings)' 2>/dev/null)
MUTED=$(osascript -e 'output muted of (get volume settings)' 2>/dev/null)

if [ "$MUTED" = "true" ]; then
  LABEL="mute"
  ICON="$VOLUME_0"
  COLOR="$GREY"
elif [ -n "$VOLUME" ]; then
  LABEL="${VOLUME}%"
  if [ "$VOLUME" -eq 0 ]; then
    ICON="$VOLUME_0"
    COLOR="$GREY"
  elif [ "$VOLUME" -lt 34 ]; then
    ICON="$VOLUME_33"
    COLOR="$WHITE"
  elif [ "$VOLUME" -lt 67 ]; then
    ICON="$VOLUME_66"
    COLOR="$WHITE"
  else
    ICON="$VOLUME_100"
    COLOR="$WHITE"
  fi
else
  LABEL="-"
  ICON="$VOLUME_0"
  COLOR="$GREY"
fi

sketchybar --set "$NAME" icon="$ICON" icon.color="$COLOR" label="$LABEL"
