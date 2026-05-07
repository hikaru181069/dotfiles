#!/usr/bin/env bash

# Shows the focused application name.
front_app=(
  script="$PLUGIN_DIR/front_app.sh"
  icon="$FRONT_APP"
  icon.color="$ORANGE"
  icon.font="$FONT:Bold:15.0"
  label.color="$WHITE"
  label.font="$FONT:Bold:12.0"
  label.max_chars=24
  padding_left=4
  padding_right=8
)

sketchybar --add item front_app left \
           --set front_app "${front_app[@]}" \
           --subscribe front_app front_app_switched
