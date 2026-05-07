#!/usr/bin/env bash

source "$HOME/.config/sketchybar/colors.sh"

# 現在の入力ソースを日本語/英語としてざっくり表示します。
SOURCE=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources 2>/dev/null \
  | awk -F'= ' '/KeyboardLayout Name|InputSourceKind|Bundle ID/ { print }')

case "$SOURCE" in
  *Japanese*|*Kotoeri*|*Hiragana*|*Katakana*|*Romaji*) LABEL="JP"; COLOR="$MAGENTA" ;;
  *ABC*|*U.S.*|*Roman*) LABEL="EN"; COLOR="$BLUE" ;;
  *) LABEL="-"; COLOR="$GREY" ;;
esac

sketchybar --set "$NAME" icon.color="$GREY" label="$LABEL"
