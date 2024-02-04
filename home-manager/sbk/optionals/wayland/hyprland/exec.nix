{ pkgs, ... }: {
  wayland.windowManager.hyprland.settings = {
    exec = [
      "${pkgs.networkmanagerapplet}/bin/nm-applet"
      # "${pkgs.swww}/bin/swww img ${config.wallpaper}"
      "${pkgs.swww}/bin/swww init"
      "${pkgs.blueman}/bin/blueman-applet"
    ];
  };

}

