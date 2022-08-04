local apps = {
    terminal = "kitty",
    launcher = "sh /home/user/.config/rofi/launch.sh",
    launcherext = "rofi -show run",
    roficalc = "rofi -show calc -modi calc -no-show-match -no-sort",
    notifications = require("widgets.volume-brightness-notifications"),
    switcher = require("widgets.alt-tab"),
    xrandr = "lxrandr",
    screenshot = "scrot -p -e 'echo $f'",
    volume = "pavucontrol",
    appearance = "lxappearance",
    browser = "firefox",
    fileexplorer = "thunar"
}

user = {terminal = "kitty", floating_terminal = "kitty"}

return apps
