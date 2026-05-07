#!/usr/bin/env bash

source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

# バッテリー残量と充電状態を表示します。
BATTERY_INFO=$(pmset -g batt)
PERCENT=$(printf '%s\n' "$BATTERY_INFO" | sed -n 's/.*[[:space:]]\([0-9][0-9]*\)%;.*/\1/p' | head -n 1)
STATUS=$(printf '%s\n' "$BATTERY_INFO" | awk -F'; *' '/InternalBattery/ { print $2 }')

[ -z "$PERCENT" ] && PERCENT="-"

ICON="$BATTERY_100"
COLOR="$GREEN"
LABEL="${PERCENT}%"

if [ "$STATUS" = "charging" ]; then
  ICON="$BATTERY_CHARGING"
  COLOR="$GREEN"
elif [ "$STATUS" = "charged" ]; then
  ICON="$BATTERY_100"
  COLOR="$GREEN"
elif [ "$PERCENT" != "-" ]; then
  if [ "$PERCENT" -le 20 ]; then
    ICON="$BATTERY_25"
    COLOR="$ORANGE"
  elif [ "$PERCENT" -le 50 ]; then
    ICON="$BATTERY_50"
    COLOR="$YELLOW"
  elif [ "$PERCENT" -le 80 ]; then
    ICON="$BATTERY_75"
    COLOR="$WHITE"
  fi
fi

sketchybar --set "$NAME" icon="$ICON" icon.color="$GREY" label="$LABEL"
