{ pkgs, ... }: {
  wayland.windowManager.hyprland.settings = {
    exec = [
      "${pkgs.networkmanagerapplet}/bin/nm-applet"
      # "${pkgs.swww}/bin/swww img ${config.wallpaper}"
      "${pkgs.blueman}/bin/blueman-applet"
      "${pkgs.swww}/bin/swww init"
    ];
  };

}

