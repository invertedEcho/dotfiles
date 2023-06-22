local wezterm = require("wezterm")
local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "Hardcore"
config.default_cursor_style = "BlinkingUnderline"
config.hide_tab_bar_if_only_one_tab = true
config.scrollback_lines = 5000
config.window_background_opacity = 0.8
return config
