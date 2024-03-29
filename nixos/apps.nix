{ pkgs, ... } :
let
  customWaybar = pkgs.waybar.override {
    wireplumber = pkgs.wireplumber.overrideAttrs (oldAttrs: rec {
      version = "0.4.17";
      src = pkgs.fetchFromGitLab {
        domain = "gitlab.freedesktop.org";
        owner = "pipewire";
        repo = "wireplumber";
        rev = version;
        hash = "sha256-vhpQT67+849WV1SFthQdUeFnYe/okudTQJoL3y+wXwI=";
      };
    });
  };
in
{
  environment.systemPackages = with pkgs; [
     rustup
     gnumake
     vim
     htop
     killall
     nvtop
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
     neovide
     gcc13
     mpv
     gnome.nautilus
     # waybar
     customWaybar
     steam
     webcord
     xwayland
     lazygit
     nodePackages_latest.typescript-language-server
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
     mako
     playerctl
     libimobiledevice
     ifuse
     tela-icon-theme
     fishPlugins.z
     chromium
  ];
}
