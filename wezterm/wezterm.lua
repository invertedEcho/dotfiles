local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Kanagawa (Gogh)"

config.font_size = 14

config.hide_tab_bar_if_only_one_tab = true

-- Both these configs are required to have a normal titlebar in GNOME.
-- https://github.com/wezterm/wezterm/issues/4962
config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"
config.enable_wayland = false

return config
