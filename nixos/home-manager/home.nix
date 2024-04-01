{ config, pkgs, ... }:

{
  home.username = "echo";
  home.homeDirectory = "/home/echo";
  home.stateVersion = "23.11";

  home.packages = [
    pkgs.oh-my-fish
  ];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.shellAliases = {
    n = "nvim";
    lg = "lazygit";
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
