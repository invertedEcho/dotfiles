{ pkgs, ... }:

let
  baseconfig = { allowUnfree = true; };
  unstable = import <nixos-unstable> { config = baseconfig; };
in {
  environment.systemPackages = with pkgs; [
    unstable.neovim
    # TODO: Move to shell.nix file in project
    (php83.buildEnv {
      extensions = ({ enabled, all }: enabled ++ (with all; [
        imagick
      ]));
    })
    rustup
    gnumake
    vim
    htop
    killall
    wget
    firefox
    neovim
    kitty
    wl-clipboard
    loupe
    wofi
    pavucontrol
    python3
    wezterm
    spotify
    gcc13
    mpv
    gnome.nautilus
    gnome.gnome-disk-utility
    waybar
    webcord
    xwayland
    lazygit
    nodePackages.typescript-language-server
    nodePackages.bash-language-server
    nodePackages.pyright
    nodePackages.eslint
    python311Packages.jedi-language-server
    tailwindcss-language-server
    prettierd
    ripgrep
    vscode-langservers-extracted
    iwgtk
    file
    grim
    slurp
    tokyo-night-gtk
    libnotify
    gammastep
    playerctl
    libimobiledevice
    ifuse
    # todo: move to home-manager
    fishPlugins.z
    chromium
    swaybg
    util-linux
    waypaper
    jq
    lua-language-server
    stylua
    nodejs_22
    corepack_22
    pkg-config
    openssl
    android-tools
    vulkan-tools
    rbw
    rofi-rbw-wayland
    pinentry
    wtype
    php83Packages.composer
    nh
    hyprlock
    protonmail-bridge-gui
    thunderbird
    statix
    swaynotificationcenter
    kooha
    openjdk17-bootstrap
    rclone
    postgresql_16
    # needed for react native building, android-nixpkgs should provide these but they are currently broken ):
    aapt
    cmake
    # end
    act
    solaar
    wlogout
    polkit
    polkit_gnome
    # .nix formatter
    nixfmt-classic
    onlyoffice-bin
    inetutils
    qemu
    qemu_full
    parted
    appimage-run
    pass
    jetbrains.idea-community-bin
    androidStudioPackages.canary
    shellcheck
    stripe-cli
  ];
}
