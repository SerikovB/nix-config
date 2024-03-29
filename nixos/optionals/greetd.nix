# Enables greetd and regreet
{ pkgs, ... }: {
  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "${pkgs.cage}/bin/cage -s ${pkgs.greetd.regreet}/bin/regreet";
      user = "sbk";
      default_session = "Hyprland";
    };
  };
  programs.regreet = { enable = true; };
}
