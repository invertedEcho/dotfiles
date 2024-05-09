{ ... }:

{
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.git.enable = true;
  programs.fish.enable = true;

  programs.adb = {
    enable = true;
  };

  # this option is not yet in 23.11, only unstable. switch to it when it becomes stable
  /* programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 5d --keep 15";
    flake = "/home/$USER/dev/priv/dotfiles";
  }; */
}
