#!/usr/bin/env sh

# CPU使用率をざっくり表示します。
CPU_USAGE=$(top -l 1 | awk '/CPU usage/ { gsub("%", "", $3); printf "%02d%%", $3 }')
sketchybar --set "$NAME" label="$CPU_USAGE"
