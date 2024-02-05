# zhs shell
{ pkgs, lib, config, ... }:

  let
    inherit (lib) mkIf;
    inherit (config) home programs;
    packageNames = map (p: p.pname or p.name or null) home.packages;
    hasPackage = name: lib.any (x: x == name) packageNames;
    hasRipgrep = hasPackage "ripgrep";
    hasExa = hasPackage "eza";
    hasSpecialisationCli = hasPackage "specialisation";
    hasNeovim = programs.neovim.enable;
    hasEmacs = programs.emacs.enable;
    hasNeomutt = programs.neomutt.enable;
    hasShellColor = programs.shellcolor.enable;
    hasKitty = programs.kitty.enable;

  in {
    programs.zsh = {
      enable = true;
      autocd = true;
      defaultKeymap = "viins";
      dotDir = ".config/zsh";

      syntaxHighlighting = { enable = true; };

      history = {
        path = "$ZDOTDIR/zhistory";
        save = 10000;
      };

      shellAliases = {
        ls = mkIf hasExa "eza";
        exa = mkIf hasExa "eza";

        e = mkIf hasNeovim "nvim";
        vi = mkIf hasNeovim "nvim";
        vim = mkIf hasNeovim "nvim";

        cik = mkIf hasKitty "clone-in-kitty --type os-window";
      };

      initExtra = ''
        precmd() {
          print -Pn "\e]133;A\e\\"
        }
        # Direnv
        eval "$(direnv hook zsh)"
      '';
    };
}
