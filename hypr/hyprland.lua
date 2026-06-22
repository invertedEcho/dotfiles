require("monitors")
require("autostart")
require("input")

local terminal = "kitty"
local fileManager = "nautilus"
local menu = "rofi -show drun"

hl.config({
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

		layout = "dwindle",
	},

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
		-- FIXME: add again
		-- bezier = "overshot,0.13,0.39,0.29,1.1",
		-- animation = "windows,1,4,overshot,slide",
		-- animation = "border,1,10,default",
		-- animation = "fade,1,10,default",
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

local mainMod = "SUPER"
local modWithShift = "SUPER + SHIFT"
local modWithCtrl = "SUPER + CTRL"

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(
	modWithShift .. " + Q",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(modWithShift .. " + Space", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("wlogout"))
hl.bind(modWithCtrl .. " + L", hl.dsp.exec_cmd("hyprlock"))

hl.bind(
	"Print",
	hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy && notify-send "Copied selected region to clipboard."')
)
hl.bind(
	mainMod .. " + Print",
	hl.dsp.exec_cmd(
		'grim -g "$(slurp)" ~/Pictures/Screenshots/screenshot-$(date +"%Y%m%d-%H%M%S").png && notify-send "Saved selected region to ~/Pictures/Screenshots"'
	)
)
hl.bind(modWithShift .. " + N", hl.dsp.exec_cmd("swaync-client -t"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("~/.local/bin/night-mode-wayland.sh"))
hl.bind(modWithShift .. " + C", hl.dsp.exec_cmd("hyprpicker | wl-copy"))
hl.bind(modWithShift .. " + T", hl.dsp.exec_cmd("python3 ~/.local/bin/toggle-monitor.py"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("~/.local/bin/toggle-bar.sh"))

hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

hl.bind(modWithShift .. " + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(modWithShift .. " + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(modWithShift .. " + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(modWithShift .. " + J", hl.dsp.window.move({ direction = "down" }))

hl.bind(mainMod .. " + M", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

-- Show the window on all workspaces (only works on floating windows)
hl.bind(modWithShift .. " + P", hl.dsp.window.pin())

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Switch to a submap called `resize`.
hl.bind("ALT + R", hl.dsp.submap("resize"))

-- Start a submap called "resize".
hl.define_submap("resize", function()
	-- Set repeating binds for resizing the active window.
	hl.bind("L", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
	hl.bind("H", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
	hl.bind("J", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
	hl.bind("K", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })

	-- Use `reset` to go back to the global submap
	hl.bind("escape", hl.dsp.submap("reset"))
end)

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

hl.window_rule({
	name = "workspace3",
	match = {
		class = "feishin",
	},
	workspace = "3",
})
hl.window_rule({
	name = "workspace4",
	match = {
		class = "proton-pass|Proton Mail|proton.vpn.app.gtk|ch.proton.bridge-gui|net.thunderbird.Thunderbird",
	},
	workspace = "4",
})
hl.window_rule({
	name = "workspace5",
	match = {
		class = "discord",
	},
	workspace = "5",
})
hl.window_rule({
	name = "workspace8",
	match = {
		class = "steam",
	},
	workspace = "8",
})
hl.window_rule({
	name = "workspace9",
	match = {
		class = "gimp|LDtk",
	},
	workspace = "9",
})
hl.window_rule({
	name = "workspace10",
	match = {
		class = "obsidian",
	},
	workspace = "10",
})

hl.window_rule({
	name = "inhibit idle when fullscreen",
	match = {
		class = "*",
	},
	idle_inhibit = "fullscreen",
})

hl.env("_JAVA_AWT_WM_NONPARENTING", "1")
