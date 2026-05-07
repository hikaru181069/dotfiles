#!/usr/bin/env sh

# 接続中のWi-Fi SSIDを表示します。SSID取得できない環境では接続状態だけ表示します。
WIFI_DEVICE=$(networksetup -listallhardwareports 2>/dev/null | awk '/Wi-Fi|AirPort/ { getline; print $2; exit }')

if [ -n "$WIFI_DEVICE" ]; then
  SSID=$(networksetup -getairportnetwork "$WIFI_DEVICE" 2>/dev/null | sed 's/^Current Wi-Fi Network: //')
fi

case "$SSID" in
  ""|"You are not associated with an AirPort network.")
    if ifconfig en0 2>/dev/null | grep -q 'status: active'; then
      LABEL="on"
    else
      LABEL="off"
    fi
    ;;
  *) LABEL="$SSID" ;;
esac

sketchybar --set "$NAME" label="$LABEL"
