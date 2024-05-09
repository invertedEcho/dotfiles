{ config, pkgs, ... }:

{
  home.username = "echo";
  home.homeDirectory = "/home/echo";
  home.stateVersion = "23.11";

  home.packages = [
    pkgs.fishPlugins.tide
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    FLAKE = "/home/echo/dev/priv/dotfiles/nixos";
  };

  home.shellAliases = {
    n = "nvim";
    lg = "lazygit";
  };

  gtk = {
    enable = true;

    theme = {
      package = pkgs.orchis-theme;
      name = "Orchis";
    };

    iconTheme = {
      package = pkgs.tela-icon-theme;
      name = "Tela";
    };

    font = {
      name = "Sans";
      size = 11;
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  programs.git = {
    enable = true;
    userName = "Jakob Stechow";
    userEmail = "jakob.stechow@pm.me";
  };

  programs.fish = {
    enable = true;
    # Disable fish greeting
    interactiveShellInit = ''
      set fish_greeting
    '';
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.home-manager.enable = true;
}
