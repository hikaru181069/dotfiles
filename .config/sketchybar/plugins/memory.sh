#!/usr/bin/env sh

# メモリ使用量をGB単位で表示します。
MEM_USED=$(memory_pressure | awk '/System-wide memory free percentage/ { gsub("%", "", $5); printf "%d%%", 100 - $5 }')
sketchybar --set "$NAME" label="$MEM_USED"
