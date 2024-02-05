# Neovim text editor
{ inputs, config, ... }: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim

    ./autocmd.nix
    ./colorconfig.nix
    ./keymaps.nix
    ./luaconfig.nix
    ./plugins.nix
  ];

  # environment.systemPackages = with pkgs; [ nodejs go ];

  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;

    colorschemes.base16 = {
      enable = true;
      customColorScheme = with config.colorscheme.palette; {
        base00 = "#${base00}";
        base01 = "#${base01}";
        base02 = "#${base02}";
        base03 = "#${base03}";
        base04 = "#${base04}";
        base05 = "#${base05}";
        base06 = "#${base06}";
        base07 = "#${base07}";
        base08 = "#${base08}";
        base09 = "#${base09}";
        base0A = "#${base0A}";
        base0B = "#${base0B}";
        base0C = "#${base0C}";
        base0D = "#${base0D}";
        base0E = "#${base0E}";
        base0F = "#${base0F}";
      };
    };

    options = {
      number = true;
      relativenumber = true;
      hidden = true;
      foldlevel = 99;
      shiftwidth = 8;
      tabstop = 8;
      softtabstop = 8;
      expandtab = true;
      autoindent = true;
      wrap = false;
      scrolloff = 5;
      sidescroll = 40;
      completeopt = [ "menu" "menuone" "noselect" ];
      pumheight = 15;
      fileencoding = "utf-8";
      swapfile = false;
      timeoutlen = 2500;
      conceallevel = 3;
    };

    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };
  };
}
