_:

{
  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    git.enable = true;
    fish.enable = true;

    adb = {
      enable = true;
    };

    # this option is not yet in 23.11, only unstable. switch to it when it becomes stable
    /* nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 5d --keep 15";
      flake = "/home/$USER/dev/priv/dotfiles";
    }; */
  };
}
