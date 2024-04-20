{ config, pkgs, ... }:

{
  home.username = "echo";
  home.homeDirectory = "/home/echo";
  home.stateVersion = "23.11";

  home.packages = [
    pkgs.oh-my-fish
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.shellAliases = {
    n = "nvim";
    lg = "lazygit";
  };

  gtk = {
    enable = true;

    theme = {
      package = pkgs.orchis-theme;
      name = "orchis-theme";
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

  programs.home-manager.enable = true;
}
