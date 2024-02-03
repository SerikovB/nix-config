# XDG configuations
{ pkgs, inputs, ... }: {
  xdg.portal = {
    enable = true;
    extraPortals = [
      inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-wlr
      ];
    configPackages = [
      inputs.hyprland.packages.${pkgs.system}.hyprland
    ];
  };
}
