# Foot terminal
{ config, ... }:
let
  font = config.fontProfiles.monospace.family;
  inherit (config.colorscheme) palette;
in {
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "${font}:size=12";
        pad = "10x10 center";
      };
      colors = {
        bright0 = "${palette.base00}";
        bright1 = "${palette.base01}";
        bright2 = "${palette.base02}";
        bright3 = "${palette.base03}";
        bright4 = "${palette.base04}";
        bright5 = "${palette.base05}";
        bright6 = "${palette.base06}";
        bright7 = "${palette.base07}";


        regular0 = "${palette.base08}";
        regular1 = "${palette.base09}";
        regular2 = "${palette.base0A}";
        regular3 = "${palette.base0B}";
        regular4 = "${palette.base0C}";
        regular5 = "${palette.base0D}";
        regular6 = "${palette.base0E}";
        regular7 = "${palette.base0F}";

        foreground = "${palette.base05}";
        background = "${palette.base00}";
        urls = "${palette.base04}";
      };
    };
  };

  home.sessionVariables = {
    TERMINAL = "foot";
  };
}
