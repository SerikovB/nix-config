# OpenGL configuration
{ pkgs, ... }: {
  hardware.opengl = {
    enable = true;
    driSupport = true;
    extraPackages = [ pkgs.mesa.drivers ];
  };
}
