{ lib, pkgs, ... }: {
  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" "repl-flake" ];
      warn-dirty = false;
      use-xdg-base-directories = true;
    };
  };
}
