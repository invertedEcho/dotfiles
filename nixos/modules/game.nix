{ pkgs, ... }:

{
  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };

    nvidia.modesetting.enable = true;
  };

  programs = {
    steam.enable = true;
    steam.gamescopeSession.enable = true;

    gamemode.enable = true;
  };

  environment.systemPackages = with pkgs; [
    lutris
  ];

}
