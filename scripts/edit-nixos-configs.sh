#!/usr/bin/env bash

BASE_DOTFILES_DIR="/home/$USER/dev/priv/dotfiles"
NIXOS_DIR="$BASE_DOTFILES_DIR/nixos"

kitty nvim "$NIXOS_DIR"
kitty sudo nixos-rebuild switch --flake "$NIXOS_DIR"/.#default
kitty lazygit -p "$BASE_DOTFILES_DIR"
