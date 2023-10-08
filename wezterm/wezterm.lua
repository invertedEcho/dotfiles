local wezterm = require("wezterm")

local function get_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return "Dark"
end

local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "tokyonight"
	else
		return "tokyonight_day"
	end
end

return {
	color_scheme = scheme_for_appearance(get_appearance()),
	default_cursor_style = "BlinkingUnderline",
	hide_tab_bar_if_only_one_tab = true,
	scrollback_lines = 5000,
	warn_about_missing_glyphs = false,
	font = wezterm.font("Iosevka Nerd Font", { weight = "Medium", stretch = "Normal", style = "Normal" }),
	font_size = 18,
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	keys = {
		-- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
		{ key = "LeftArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bb" }) },
		-- Make Option-Right equivalent to Alt-f; forward-word
		{ key = "RightArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bf" }) },
	},
}
