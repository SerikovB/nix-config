# Home-manager configuration file
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    # Modules
    inputs.nix-colors.homeManagerModules.default

    # Theming
    ./theming.nix

    # Optionals
    # ./nvim.nix
  ];

  home.packages = with pkgs; [
  ];

  nixpkgs = {
    # Overlays
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];

    # Nixpkgs configuration
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "sbk";
    homeDirectory = "/home/sbk";
  };


  programs.home-manager.enable = true;
  programs.git.enable = true;

  systemd.user.startServices = "sd-switch";
  home.stateVersion = "23.11";
}
