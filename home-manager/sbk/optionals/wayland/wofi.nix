# Wofi launcher
{ config, pkgs, ... }:
let
  wofi-toggle = pkgs.writeShellScriptBin "wofi-toggle" ''
    if [ -z $(pidof wofi) ]; then
      ${pkgs.wofi}/bin/wofi $@
    else
      kill $(pidof wofi)
    fi
  '';

  wofi-powermenu = pkgs.writeShellScriptBin "wofi-powermenu" ''
    entries="󰍃  Logout\n⏾  Suspend\n󰒲  Hibernate\n  Reboot\n󰐥  Poweroff"
    selected=$(echo -e $entries | wofi-toggle $@ | awk '{print tolower($2)}')

    case $selected in
      logout)
        hyprctl dispatch exit;;
      suspend)
        exec systemctl suspend;;
      hibernate)
        exec systemctl hibernate;;
      reboot)
        exec systemctl reboot;;
      poweroff)
        exec systemctl poweroff -i;;
    esac
  '';

  inherit (config.colorscheme) palette;
in {
  programs.wofi = {
    enable = true;
    package = pkgs.wofi;
    settings = {
      image_size = 48;
      columns = 3;
      allow_images = true;
      insensitive = true;
      run-always_parse_args = true;
      run-cache_files = "/dev/null";
      run-exec_search = true;
    };
    style = ''
      * {
        font-family: ${config.fontProfiles.regular.family}, ${config.fontProfiles.monospace.family};
        font-size: 12pt;
      }
      window {
        border: 2px solid #${palette.base03};
        border-radius: 7px;
      }
    '';
  };

  home.packages = [ wofi-toggle wofi-powermenu ];
}
