#!/usr/bin/env sh

# 現在フォーカスしているアプリ名を表示します。
if [ -n "$INFO" ]; then
  APP_NAME="$INFO"
else
  APP_NAME=$(osascript -e 'tell application "System Events" to get name of first application process whose frontmost is true' 2>/dev/null)
fi

[ -z "$APP_NAME" ] && APP_NAME="-"
sketchybar --set "$NAME" label="$APP_NAME"
