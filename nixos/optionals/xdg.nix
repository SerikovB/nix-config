# XDG configuations
{ pkgs, ... }: {
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
    config = {
      default = [
        "gtk"
      ];
      Hyprland = [
        "hyprland"
        "gtk"
      ];
    };
  };
}
