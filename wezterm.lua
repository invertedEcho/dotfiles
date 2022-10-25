local wezterm = require("wezterm")
local act = wezterm.action

return {
	color_scheme = "tokyonight",
	keys = {
		{ key = "t", mods = "SUPER|SHIFT", action = act.SpawnTab("CurrentPaneDomain") },
		{ key = "{", mods = "SHIFT|SUPER", action = act.ActivateTabRelative(-1) },
		{ key = "}", mods = "SHIFT|SUPER", action = act.ActivateTabRelative(1) },
	},
}
