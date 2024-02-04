# Binds
{ config, lib, pkgs, ... }:
let
  terminal = config.home.sessionVariables.TERMINAL;
  swaylock = "${config.programs.swaylock.package}/bin/swaylock";
  makoctl = "${config.services.mako.package}/bin/makoctl";
  grimblast = "${pkgs.grimblast}/bin/grimblast";

  brightnessctl = "${pkgs.brightnessctl}/bin/brightnessctl";
  wpctl = "${pkgs.wireplumber}/bin/wpctl";
in {
  wayland.windowManager.hyprland.settings.bind = [
    "SUPER,Return,exec,${terminal}"

    ",Print,exec,${grimblast} --notify --freeze copy output"
    "SUPER,Print,exec,${grimblast} --notify --freeze save output"

    "SHIFT,Print,exec,${grimblast} --notify --freeze copy active"
    "SUPERSHIFT,Print,exec,${grimblast} --notify --freeze save active"

    "CONTROL,Print,exec,${grimblast} --notify --freeze copy screen"
    "CTRL_SUPER,Print,exec,${grimblast} --notify --freeze save screen"

    "ALT,Print,exec,${grimblast} --notify --freeze copy area"
    "SUPERALT,Print,exec,${grimblast} --notify --freeze save area"

    ",XF86MonBrightnessUp,exec,${brightnessctl} s 10%+"
    ",XF86MonBrightnessDown,exec,${brightnessctl} s 10%-"

    # WP bindings for PipeWire
    ",XF86AudioRaiseVolume,exec,${wpctl} set-volume @DEFAULT_SINK@ 5%+"
    "SHIFT,XF86AudioRaiseVolume,exec,${wpctl} set-volume @DEFAULT_SINK@ 15%+"
    ",XF86AudioLowerVolume,exec,${wpctl} set-volume @DEFAULT_SINK@ 5%-"
    "SHIFT,XF86AudioLowerVolume,exec,${wpctl} set-volume @DEFAULT_SINK@ 15%-"
    ",XF86AudioMute,exec,${wpctl} set-mute @DEFAULT_SINK@ toggle"
    "SHIFT,XF86AudioMute,exec,${wpctl} set-mute @DEFAULT_SOURCE@ toggle"
  ] ++

    (lib.optionals config.programs.wofi.enable [
      "SUPER,d,exec,wofi-toggle -S drun -i -x 10 -y 10 -W 30% -H 60%"
      "SUPER,p,exec,wofi-powermenu -S dmenu -w 1 -L 6 -W 20% -x 10 -y 10"
    ]) ++

    (lib.optionals config.programs.swaylock.enable
      [ ",XF86Launch2,exec,${swaylock} -S --grace 2" ]) ++

    (lib.optionals config.services.mako.enable
      [ "SUPER,w,exec,${makoctl} dismiss" ]);
}
