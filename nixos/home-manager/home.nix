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

  gtk.cursorTheme = {
    name = "Bibata-Modern-Ice";
  };

home.pointerCursor = 
  let 
    getFrom = url: hash: name: {
        gtk.enable = true;
        x11.enable = true;
        name = name;
        size = 24;
        package = 
          pkgs.runCommand "moveUp" {} ''
            mkdir -p $out/share/icons
            ln -s ${pkgs.fetchzip {
              url = url;
              hash = hash;
            }} $out/share/icons/${name}
        '';
      };
  in
    getFrom 
      "https://github.com/ful1e5/Bibata_Cursor/releases/download/v2.0.6/Bibata-Modern-Ice.tar.xz"
      "sha256-wCrIjQo7eKO+piIz88TZDpMnc51iCWDYBR7HBV8/CPI="
      "Bibata-Modern-Ice";

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
