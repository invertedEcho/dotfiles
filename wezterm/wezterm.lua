local wezterm = require("wezterm")

return {
	color_scheme = "tokyonight",
	default_cursor_style = "BlinkingUnderline",
	hide_tab_bar_if_only_one_tab = true,
	scrollback_lines = 5000,
	warn_about_missing_glyphs = false,
	-- font = wezterm.font("Iosevka Nerd Font Mono", { weight = "Medium", stretch = "Normal", style = "Normal" }),
	font_size = 14,
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	keys = {
		{ key = "LeftArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bb" }) },
		{ key = "RightArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bf" }) },
	},
	window_decorations = "RESIZE",
}
