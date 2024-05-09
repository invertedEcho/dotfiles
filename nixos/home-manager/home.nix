{ config, pkgs, ... }:

{
  home = {
    username = "echo";
    homeDirectory = "/home/echo";
    stateVersion = "23.11";

    packages = [
      pkgs.fishPlugins.tide
    ];

    sessionVariables = {
      EDITOR = "nvim";
      FLAKE = "/home/echo/dev/priv/dotfiles/nixos";
    };

    shellAliases = {
      n = "nvim";
      lg = "lazygit";
    };
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

  programs = {
    git = {
      enable = true;
      userName = "Jakob Stechow";
      userEmail = "jakob.stechow@pm.me";
    };

    fish = {
      enable = true;
      # Disable fish greeting
      interactiveShellInit = ''
	set fish_greeting
      '';
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    home-manager.enable = true;
  };
}
