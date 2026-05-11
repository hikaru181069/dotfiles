local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font_with_fallback({
	"Maple Mono NF",
	"Maple Mono NF CN",
	"Noto Color Emoji",
})

config.font_size = 19.5

config.colors = {
	cursor_bg = "#7f849c",
	cursor_fg = "#1e1e2e",
	cursor_border = "#7f849c",
}

config.color_scheme = "Catppuccin Mocha"

-- 起動時のウィンドウサイズ
config.initial_cols = 130
config.initial_rows = 38

-- transparent
-- config.window_background_opacity = 0.9

-- window
config.window_decorations = "RESIZE"

-- tabbar
config.enable_tab_bar = false

-- cursor
-- config.default_cursor_style = "BlinkingBar"

-- スクロールバー消す
config.enable_scroll_bar = false

-- パディング
config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 10,
}

return config
