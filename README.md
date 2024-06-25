# dotfiles

## setup

- Clone this repository

- Link my configurations into their corresponding folders using dotbot:

> [!IMPORTANT]
> This will only work if the target files/directories don't already exist

```bash
./install
```

obsidian on nixos pkgs sucks, so:

```bash
wget https://github.com/obsidianmd/obsidian-releases/releases/latest/download/Obsidian-1.6.3.AppImage -o ~/.local/bin/Obsidian.AppImage
chmod +x ~/.local/bin/Obsidian.AppImage
appimage-run ~/.local/bin/Obsidian.AppImage
```

## notes

- nvim config will only work on >=0.9 or something like that

## configs

- hypr: configurations for hyprland, the window manager i use
- intellij-settings: yeah
- kitty: configurations for the terminal i use
- nixos: my nixos configs -> lets see if nixos is actually endgame distro
- nvim: behold, the configurations of the editor i love so much
- scripts: some useful utility shell scripts
- swaync: configurations for a notification center & daemon
- waybar: configurations for a bar for wayland
- wofi: configurations for an application launcher for wayland
- install.conf.yaml: configuration telling dotbot what to do
