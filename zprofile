if [ -z "$SSH_AUTH_SOCK" ]; then
  eval "$(ssh-agent -s)" > /dev/null
fi

if [[ ! ${WAYLAND_DISPLAY} ]]; then
  exec Hyprland
fi

export XCURSOR_THEME=Bibata-Modern-Classic
