# Foot terminal
{...}: {
  programs.foot = {
    enable = true;
  };

  home.sessionVariables = {
    TERMINAL = "foot";
  };
}
