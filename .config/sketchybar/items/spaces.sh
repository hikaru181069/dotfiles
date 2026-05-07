#!/usr/bin/env bash

# Minimal spaces, styled as a rounded group. No yabai click actions.
SPACE_ICONS=("1" "2" "3" "4" "5" "6")

for i in "${!SPACE_ICONS[@]}"; do
  sid=$((i + 1))
  space=(
    space="$sid"
    icon="${SPACE_ICONS[i]}"
    icon.padding_left=10
    icon.padding_right=10
    label.drawing=off
    icon.highlight_color="$RED"
    background.drawing=off
    script="$PLUGIN_DIR/space.sh"
  )

  sketchybar --add space "space.$sid" left \
             --set "space.$sid" "${space[@]}" \
             --subscribe "space.$sid" space_change
done

spaces=(
  background.color="$BACKGROUND_1"
  background.border_color="$BACKGROUND_2"
  background.border_width=2
  background.drawing=on
)

separator=(
  icon="$SEPARATOR"
  icon.font="$FONT:Bold:14.0"
  icon.color="$GREY"
  padding_left=8
  padding_right=10
  label.drawing=off
)

sketchybar --add bracket spaces '/space\..*/' \
           --set spaces "${spaces[@]}" \
           --add item separator left \
           --set separator "${separator[@]}"
