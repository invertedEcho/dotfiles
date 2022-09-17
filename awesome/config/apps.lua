local apps = {
	terminal = "kitty",
	launcher = "rofi -show drun",
	launcherext = "rofi -show run",
	roficalc = "rofi -show calc -modi calc -no-show-match -no-sort",
	notifications = require("widgets.volume-brightness-notifications"),
	switcher = require("widgets.alt-tab"),
	xrandr = "lxrandr",
	screenshot = "scrot -p -e 'echo $f'",
	volume = "pavucontrol",
	appearance = "lxappearance",
	browser = "firefox",
	fileexplorer = "thunar",
}

return apps
