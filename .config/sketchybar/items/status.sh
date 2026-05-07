#!/usr/bin/env bash

# Right side status group. Kept dependency-light and local-machine friendly.
calendar=(
  icon="$CLOCK"
  icon.color="$GREY"
  update_freq=30
  script="$PLUGIN_DIR/clock.sh"
)

input=(
  icon="$INPUT"
  icon.color="$GREY"
  update_freq=2
  script="$PLUGIN_DIR/input.sh"
)

git_branch=(
  icon="$GIT_BRANCH"
  icon.color="$GREY"
  label.max_chars=18
  update_freq=10
  script="$PLUGIN_DIR/git_branch.sh"
)

docker=(
  icon="$DOCKER"
  icon.color="$GREY"
  update_freq=10
  script="$PLUGIN_DIR/docker.sh"
)

wifi=(
  icon="$WIFI"
  icon.color="$GREY"
  update_freq=10
  script="$PLUGIN_DIR/wifi.sh"
)

battery=(
  icon="$BATTERY_100"
  icon.color="$GREY"
  update_freq=30
  script="$PLUGIN_DIR/battery.sh"
)

volume=(
  icon="$VOLUME_100"
  icon.color="$GREY"
  update_freq=5
  script="$PLUGIN_DIR/volume.sh"
)

cpu=(
  icon="$CPU"
  icon.color="$GREY"
  update_freq=5
  script="$PLUGIN_DIR/cpu.sh"
)

memory=(
  icon="$MEMORY"
  icon.color="$GREY"
  update_freq=10
  script="$PLUGIN_DIR/memory.sh"
)

status_bracket=(
  background.color="$TRANSPARENT"
  background.border_color="$TRANSPARENT"
  background.border_width=2
)

# Items added to the right appear from right to left on screen.
# This order renders left to right as:
# git_branch, docker, wifi, cpu, memory, battery, volume, input, calendar.
sketchybar --add item calendar right \
           --set calendar "${calendar[@]}" \
           --subscribe calendar system_woke \
           --add item input right \
           --set input "${input[@]}" \
           --add item volume right \
           --set volume "${volume[@]}" \
           --subscribe volume volume_change \
           --add item battery right \
           --set battery "${battery[@]}" \
           --subscribe battery power_source_change system_woke \
           --add item memory right \
           --set memory "${memory[@]}" \
           --add item cpu right \
           --set cpu "${cpu[@]}" \
           --add item wifi right \
           --set wifi "${wifi[@]}" \
           --add item docker right \
           --set docker "${docker[@]}" \
           --add item git_branch right \
           --set git_branch "${git_branch[@]}" \
           --add bracket status git_branch docker wifi cpu memory battery volume input calendar \
           --set status "${status_bracket[@]}"
