require("monitors")
require("autostart")
require("input")
require("keybinds")

hl.env("GTK_THEME", "Orchis-Dark")

hl.config({
	render = {
		-- enable HDR for fullscreen apps
		cm_auto_hdr = true,
	},
	general = {
		gaps_in = 3,
		gaps_out = 5,

		border_size = 2,

		col = {
			active_border = "rgb(FFC777)",
			inactive_border = "rgb(3A372F)",
		},

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,

		allow_tearing = true,

		layout = "scrolling",
	},
	-- scrolling = {
	-- 	-- each window should always take up the entire width of the monitor/workspace
	-- 	column_width = 1.0,
	-- },
	decoration = {
		rounding = 6,
		rounding_power = 2,

		-- Change transparency of focused and unfocused windows
		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},

		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
	},
	animations = {
		enabled = true,
	},
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Default springs
hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

hl.config({
	scrolling = {
		fullscreen_on_one_column = true,
	},
})

hl.config({
	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
		vrr = 0,
		animate_manual_resizes = true,
		enable_anr_dialog = false, -- application not responding
	},
})

---------------
---- INPUT ----
---------------

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
suppressMaximizeRule:set_enabled(false)

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

hl.window_rule({
	name = "float by class",
	match = {
		class = "org.gnome.Nautilus|ddcui|org.gnome.Loupe|org.gnome.Calculator|org.pulseaudio.pavucontrol|blueman-manager|xdg-desktop-portal-gtk|arena-shooter|de.tha.oop.praktikum.bomberman.Launcher",
	},
	float = true,
})
hl.window_rule({
	name = "float by title",
	match = {
		title = "demo-client client|Export Image as PNG",
	},
	float = true,
})

-- hl.window_rule({
-- 	name = "workspace3",
-- 	match = {
-- 		class = "feishin",
-- 	},
-- 	workspace = "3",
-- })
-- hl.window_rule({
-- 	name = "workspace4",
-- 	match = {
-- 		class = "proton-pass|Proton Mail|protonvpn-app|ch.proton.bridge-gui|net.thunderbird.Thunderbird",
-- 	},
-- 	workspace = "4",
-- })
-- hl.window_rule({
-- 	name = "workspace5",
-- 	match = {
-- 		class = "discord",
-- 	},
-- 	workspace = "5",
-- })
-- hl.window_rule({
-- 	name = "workspace8",
-- 	match = {
-- 		class = "steam",
-- 	},
-- 	workspace = "8",
-- })
-- hl.window_rule({
-- 	name = "workspace9",
-- 	match = {
-- 		class = "gimp|LDtk",
-- 	},
-- 	workspace = "9",
-- })
-- hl.window_rule({
-- 	name = "workspace10",
-- 	match = {
-- 		class = "obsidian",
-- 	},
-- 	workspace = "10",
-- })

hl.window_rule({
	name = "inhibit idle when fullscreen",
	match = {
		class = "*",
	},
	idle_inhibit = "fullscreen",
})

hl.env("_JAVA_AWT_WM_NONPARENTING", "1")

hl.device({
	name = "opentabletdriver-virtual-tablet",
	output = "DP-2",
})
