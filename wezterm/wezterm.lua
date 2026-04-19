local wezterm = require 'wezterm'

return {
  font = wezterm.font("Maple Mono NF"),
  font_size = 21.0,

  color_scheme = "Catppuccin Mocha",

  -- tranceparent
  --window_background_opacity = 0.9,

  -- window
  window_decorations = "RESIZE",

  -- tabbar
  enable_tab_bar = false,

  -- cursor
  --default_cursor_style = "BlinkingBar",

  -- スクロールバー消す
  enable_scroll_bar = false,

  -- パディング
  window_padding = {
    left = 10,
    right = 10,
    top = 10,
    bottom = 10,
  },
}
