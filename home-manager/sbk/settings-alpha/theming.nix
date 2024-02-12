# Theming
{
  inputs,
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (inputs.nix-colors) colorSchemes;
  inherit
    (inputs.nix-colors.lib-contrib {inherit pkgs;})
    nixWallpaperFromScheme
    ;
  inherit (inputs.nix-colors.lib-contrib { inherit pkgs; }) gtkThemeFromScheme;
in {
  imports = [inputs.nix-colors.homeManagerModule];

  # Colorscheme
  colorscheme = lib.mkDefault colorSchemes.tokyo-night-dark;

  # Specialisation toggle with toggle-scheme script
  specialisation = {
    light.configuration.colorscheme = colorSchemes.tokyo-night-light;
    dark.configuration.colorscheme = colorSchemes.tokyo-night-dark;
  };

  # Fonts
  fontProfiles = {
    enable = true;
    monospace = {
      family = "FiraCode Nerd Font";
      package = pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; };
    };
    regular = {
      family = "Fira Sans";
      package = pkgs.fira;
    };
  };

  # GTK theme
  gtk = {
    enable = true;
    font = {
      name = config.fontProfiles.regular.family;
      size = 12;
    };
    theme = {
      name = config.colorscheme.slug;
      package = gtkThemeFromScheme { scheme = config.colorscheme; };
    };
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
  };

  # Qt theme
  qt = {
    enable = true;
    platformTheme = "gtk";
    style = {
      name = "gtk2";
      package = pkgs.qt6Packages.qt6gtk2;
    };
  };

  # Files
  home.file = {
    ".config/colorscheme".text = config.colorscheme.slug;
    ".config/colorscheme.json".text = builtins.toJSON config.colorscheme;
    "pictures/wallpapers/default.png" = let
      largest = f: xs: builtins.head (builtins.sort (a: b: a > b) (map f xs));
      largestWidth = largest (x: x.width) config.monitors;
      largestHeight = largest (x: x.height) config.monitors;
    in {
      enable = true;
      source = nixWallpaperFromScheme {
        scheme = config.colorscheme;
        width = largestWidth;
        height = largestHeight;
        logoScale = 4;
      };
    };
  };

  # Scripts
  home.packages = let
    specialisation = pkgs.writeShellScriptBin "specialisation" ''
      profiles="$HOME/.local/state/nix/profiles"
      current="$profiles/home-manager"
      base="$profiles/home-manager-base"

      # If current contains specialisations, link it as base
      if [ -d "$current/specialisation" ]; then
        echo >&2 "Using current profile as base"
        ln -sfT "$(readlink "$current")" "$base"
      # Check that $base contains specialisations before proceeding
      elif [ -d "$base/specialisation" ]; then
        echo >&2 "Using previously linked base profile"
      else
        echo >&2 "No suitable base config found. Try 'home-manager switch' again."
        exit 1
      fi

      if [ "$1" = "list" ] || [ "$1" = "-l" ] || [ "$1" = "--list" ]; then
        find "$base/specialisation" -type l -printf "%f\n"
        exit 0
      fi

      echo >&2 "Switching to ''${1:-base} specialisation"
        if [ -n "$1" ]; then
        "$base/specialisation/$1/activate"
      else
        "$base/activate"
      fi
    '';

    toggle-theme = pkgs.writeShellScriptBin "toggle-theme" ''
      if [ -n "$1" ]; then
        theme="$1"
      else
        current="$(${
        lib.getExe pkgs.jq
      } -re '.variant' "$HOME/.config/colorscheme.json")"
        if [ "$current" = "light" ]; then
            theme="dark"
        else
            theme="light"
        fi
      fi
      ${lib.getExe specialisation} "$theme"

      ${pkgs.swww}/bin/swww kill
      ${pkgs.swww}/bin/swww init
    '';
  in [specialisation toggle-theme];

  # Xsettingsd
  services.xsettingsd = {
    enable = true;
    settings = {
      "Net/ThemeName" = "${config.gtk.theme.name}";
      "Net/IconThemeName" = "${config.gtk.iconTheme.name}";
    };
  };
}
