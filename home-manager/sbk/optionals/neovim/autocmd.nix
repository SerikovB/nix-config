{ ... }: {
  programs.nixvim.autoCmd = [
    {
      event = "VimEnter";
      command = "set nofoldenable";
      desc = "Unfold All";
    }
    {
      event = "BufWrite";
      command = "%s/\\s\\+$//e";
      desc = "Remove Whitespaces";
    }
    {
      event = "FileType";
      pattern = [ "markdown" "org" "norg" ];
      command = "setlocal conceallevel=2 shiftwidth=2 tabstop=2 softtabstop=2";
      desc = "Conceal Syntax Attribute";
    }
    {
      event = "FileType";
      pattern = [ "markdown" "org" "norg" ];
      command = "setlocal spell spelllang=en,ru";
      desc = "Spell Checking";
    }
    {
      event = "FileType";
      pattern = [ "nix" "lean" ];
      command = "setlocal shiftwidth=2 tabstop=2 softtabstop=2";
      desc = "Nix file settings";
    }
    {
      event = "FileType";
      pattern = [ "markdown" "org" "norg" ];
      command = ":TableModeEnable";
      desc = "Table Mode";
    }
    {
      event = "FileType";
      pattern = [ "markdown" ];
      command = "setlocal scrolloff=30";
      desc = "Fixed cursor location on markdown (for preview)";
    }
  ];
}
