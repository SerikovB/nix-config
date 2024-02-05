{ pkgs, inputs, config, lib, ... }:

{
  imports = [
    # Modules
    inputs.hyprland.homeManagerModules.default

    # Settings
    ./wm-binds.nix
    ./binds.nix
    ./exec.nix
  ];

  home.packages = [
    pkgs.hyprpicker
    pkgs.swww
    inputs.hyprwm-contrib.packages.${pkgs.system}.grimblast
    pkgs.unstable.libdrm
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    xwayland.enable = true;
    systemd = {
      enable = true;
      extraCommands = lib.mkBefore [
        "systemctl --user stop graphical-session.target"
        "systemctl --user start hyprland-session.target"
      ];
    };

    settings = {
      general = {
        gaps_in = 15;
        gaps_out = 20;
        border_size = 2;
        cursor_inactive_timeout = 4;
        "col.active_border" = "0xff${config.colorscheme.palette.base03}";
        "col.inactive_border" = "0xff${config.colorscheme.palette.base01}";
      };

      group = {
        "col.border_active" = "0xff${config.colorscheme.palette.base03}";
        "col.border_inactive" = "0xff${config.colorscheme.palette.base01}";
        groupbar = { font_size = 11; };
      };

      decoration = {
        active_opacity = 0.95;
        inactive_opacity = 0.75;
        fullscreen_opacity = 1.0;
        rounding = 7;
        blur = {
          enabled = true;
          size = 5;
          passes = 3;
          new_optimizations = true;
          ignore_opacity = true;
        };
        drop_shadow = true;
        shadow_range = 12;
        shadow_offset = "3 3";
        "col.shadow" = "0x44000000";
        "col.shadow_inactive" = "0x66000000";
      };

      animations = {
        enabled = true;
        bezier = [
          "easein,0.11, 0, 0.5, 0"
          "easeout,0.5, 1, 0.89, 1"
          "easeinback,0.36, 0, 0.66, -0.56"
          "easeoutback,0.34, 1.56, 0.64, 1"
        ];

        animation = [
          "windowsIn,1,3,easeoutback,slide"
          "windowsOut,1,3,easeinback,slide"
          "windowsMove,1,3,easeoutback"
          "workspaces,1,2,easeoutback,slide"
          "fadeIn,1,3,easeout"
          "fadeOut,1,3,easein"
          "fadeSwitch,1,3,easeout"
          "fadeShadow,1,3,easeout"
          "fadeDim,1,3,easeout"
          "border,1,3,easeout"
        ];
      };

      input = {
        kb_layout = "us,ru,kz";
        kb_options = "grp:alt_shift_toggle";
        touchpad.disable_while_typing = false;
      };

      dwindle.split_width_multiplier = 1.35;

      misc = {
        vfr = true;
        close_special_on_empty = true;
        new_window_takes_over_fullscreen = 2;
      };
    };

    # For Nvidia
    extraConfig = ''
      env = LIBVA_DRIVER_NAME,nvidia
      env = XDG_SESSION_TYPE,wayland
      env = GBM_BACKEND,nvidia-drm
      env = __GLX_VENDOR_LIBRARY_NAME,nvidia
      env = WLR_NO_HARDWARE_CURSORS,1
      env = WLR_RENDERER_ALLOW_SOFTWARE,1
    '';
  };
}
