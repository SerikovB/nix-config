{ config, ... }:
let c = config.colorscheme.colors;
in
{
  programs.nixvim = {
    extraConfigLua = ''
      require("luasnip.loaders.from_vscode").lazy_load()
      require('orgmode').setup({
        org_agenda_files = { '~/org/**/*' },
        org_default_notes_file = '~/org/refile.org',
      })
      vim.cmd[[
        augroup orgmode_settings
          autocmd!
          autocmd FileType org
          \ setlocal conceallevel=2 |
          \ setlocal concealcursor=nc
        augroup END
      ]]

      require('org-bullets').setup()
      require('colorconfig')

      -- Telescope Colors
      vim.api.nvim_set_hl(0, 'TelescopeNormal',         { fg="#${c.base05}", bg="#${c.base01}" })
      vim.api.nvim_set_hl(0, 'TelescopeBorder',         { fg="#${c.base05}", bg="#${c.base01}" })
      vim.api.nvim_set_hl(0, 'TelescopePromptNormal',   { fg="#${c.base05}", bg="#${c.base01}" })
      vim.api.nvim_set_hl(0, 'TelescopePromptBorder',   { fg="#${c.base05}", bg="#${c.base01}" })
      vim.api.nvim_set_hl(0, 'TelescopePromptTitle',    { fg="#${c.base05}", bg="#${c.base01}" })
      vim.api.nvim_set_hl(0, 'TelescopePreviewTitle',   { fg="#${c.base05}", bg="#${c.base01}" })
      vim.api.nvim_set_hl(0, 'TelescopeResultsTitle',   { fg="#${c.base05}", bg="#${c.base01}" })
      vim.api.nvim_set_hl(0, 'TelescopeResultsTitle',   { fg="#${c.base05}", bg="#${c.base01}" })
      vim.api.nvim_set_hl(0, 'NoiceCmdlinePopupBorder', { fg="#${c.base05}", bg="#${c.base01}" })
      vim.api.nvim_set_hl(0, 'TelescopeSelection',      { fg="#${c.base0E}", bg="#${c.base01}" })
      vim.api.nvim_set_hl(0, 'TelescopePreviewLine',    { fg="#${c.base0E}", bg="#${c.base01}" })
      vim.api.nvim_set_hl(0, 'TelescopePromptPrefix',   { fg="#${c.base0E}", bg="#${c.base01}" })

    '';

    extraConfigLuaPre = ''
      require('orgmode').setup_ts_grammar()
    '';
  };

  home.file = {
    ".config/nvim/lua" = {
      source = ./lua;
      recursive = true;
    };
  };
}
