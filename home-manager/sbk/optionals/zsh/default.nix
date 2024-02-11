# zhs shell
{ pkgs, lib, config, ... }:

let
  inherit (lib) mkIf;
  inherit (config) home programs;
  packageNames = map (p: p.pname or p.name or null) home.packages;
  hasPackage = name: lib.any (x: x == name) packageNames;
  hasExa = hasPackage "eza";
  hasNeovim = programs.neovim.enable;

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

      nfu = "nix flake update $FLAKE";
      hmf = "home-manager switch --flake $FLAKE";
      nsf = "sudo nixos-rebuild switch --flake $FLAKE";
    };

    plugins = [{
      name = "powerlavel10k";
      src = pkgs.zsh-powerlevel10k;
      file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    }];

    initExtra = ''
      source $ZDOTDIR/.p10k.zsh

      precmd() {
        print -Pn "\e]133;A\e\\"
      }
      # Direnv
      eval "$(direnv hook zsh)"
    '';
  };

  home.file.".config/zsh/.p10k.zsh" = {
    enable = true;
    source = ./.p10k.zsh;
  };
}
