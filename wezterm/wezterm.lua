local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font_size = 14

config.hide_tab_bar_if_only_one_tab = true

-- Both these configs are required to have a normal titlebar in GNOME.
-- https://github.com/wezterm/wezterm/issues/4962
config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"
config.enable_wayland = false

-- Theme
local dark_theme = wezterm.color.get_builtin_schemes()["Kanagawa (Gogh)"]
-- dark_theme.foreground = "#f0f0f0"
-- dark_theme.background = "#111111"

local light_theme = {
	background = "#f2ecbc",
	foreground = "#222222",

	cursor_bg = "#c8c093",
	cursor_fg = "#c8c093",
	cursor_border = "#c8c093",

	selection_fg = "#c8c093",
	selection_bg = "#2d4f67",

	scrollbar_thumb = "#16161d",
	split = "#16161d",

	ansi = { "#c8c093", "#c34043", "#76946a", "#c0a36e", "#7e9cd8", "#957fb8", "#6a9589", "#090618" },
	brights = { "#dcd7ba", "#e82424", "#98bb6c", "#e6c384", "#7fb4ca", "#938aa9", "#7aa89f", "#727169" },
	indexed = { [16] = "#ffa066", [17] = "#ff5d62" },
}

config.color_schemes = {
	["Kanagawa Dark"] = dark_theme,
	["Kanagawa Light"] = light_theme,
}

function get_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return "Dark"
end

function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Kanagawa Dark"
	else
		return "Kanagawa Light"
	end
end

config.color_scheme = scheme_for_appearance(get_appearance())

return config
