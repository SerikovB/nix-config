# Enables zsh
{ ... }: {
  programs.zsh = {
    enable = true;
    histSize = 10000;
    histFile = "$ZDOTDIR/zhistory";
  };

  environment.sessionVariables = rec {
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";
    XDG_BIN_HOME = "$HOME/.local/bin";
    ZDOTDIR = "$HOME/.config/zsh";
    PATH = [ "${XDG_BIN_HOME}" ];
  };
}
