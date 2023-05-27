local wezterm = require("wezterm")
local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "Catppuccin Mocha"
config.enable_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.default_cursor_style = "BlinkingUnderline"
return config
