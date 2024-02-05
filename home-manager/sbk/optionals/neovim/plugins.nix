{ pkgs, config, ... }:
let
  c = config.colorscheme.palette;
in
{
  programs.nixvim = {
    plugins = {
      lualine = {
        enable = true;
        theme = {
          normal = {
            a = {
              bg = "#${c.base04}";
              fg = "#${c.base00}";
              gui = "bold";
              };
            b = {
              bg = "#${c.base05}";
              fg = "#${c.base00}";
            };
            c = {
              bg = "#${c.base01}";
              fg = "#${c.base04}";
            };
          };
          insert = {
            a = {
              bg = "#${c.base06}";
              fg = "#${c.base00}";
              gui = "bold";
              };
          };
          visual = {
            a = {
              bg = "#${c.base08}";
              fg = "#${c.base00}";
              gui = "bold";
              };
          };
          replace = {
            a = {
              bg = "#${c.base09}";
              fg = "#${c.base00}";
              gui = "bold";
              };
          };
          inactive = {
            a = {
              bg = "#${c.base04}";
              fg = "#${c.base01}";
              gui = "bold";
              };
            b = {
              bg = "#${c.base04}";
              fg = "#${c.base01}";
              };
            c = {
              bg = "#${c.base04}";
              fg = "#${c.base01}";
              };
          };
        };
      };

      barbar.enable = true;
      gitgutter.enable = true;

      indent-blankline = {
        enable = true;
        scope.enabled = true;
      };

      lastplace.enable = true;
      comment-nvim.enable = true;
      fugitive.enable = true;
      markdown-preview.enable = true;
      nvim-autopairs.enable = true;

      telescope = {
        enable = true;
        extraOptions = { pickers.find_files = { hidden = true; }; };
        keymaps = {
          "<leader>ff" = "find_files";
          "<leader>fg" = "live_grep";
          "<leader>fb" = "buffers";
          "<leader>fh" = "help_tags";
        };
      };

      neo-tree = {
        enable = true;
        window.width = 30;
        closeIfLastWindow = true;
        extraOptions = {
          filesystem = { filtered_items = { visible = true; }; };
        };
      };

      undotree = {
        enable = true;
        focusOnToggle = true;
        highlightChangedText = true;
      };

      treesitter = {
        enable = true;
        nixvimInjections = true;
        folding = false;
        indent = true;
        nixGrammars = true;
        ensureInstalled = "all";
        incrementalSelection.enable = true;
      };

      treesitter-refactor = { enable = true; };

      nvim-colorizer = {
        enable = true;
        userDefaultOptions = {
          css = true;
          tailwind = "both";
        };
      };

      neorg = {
        enable = true;
        lazyLoading = true;
        modules = {
          "core.defaults".__empty = null;
          "core.dirman".config = {
            workspaces = { notes = "~/Notes"; };
            default_workspace = "notes";
          };
          "core.concealer".__empty = null;
          "core.completion".config.engine = "nvim-cmp";
        };
      };

      lsp = {
        enable = true;
        servers = {
          nil_ls.enable = true;
          svelte.enable = true;
          html.enable = true;
          cssls.enable = true;
          tsserver.enable = true;
          pyright.enable = true;
          tailwindcss = {
            enable = true;
            filetypes = [ "html" "js" "ts" "jsx" "tsx" "mdx" "svelte" ];
          };
          gopls.enable = true;
        };
      };

      lspkind = {
        enable = true;
        cmp = {
          enable = true;
          menu = {
            nvim_lsp = "[LSP]";
            nvim_lua = "[api]";
            path = "[path]";
            luasnip = "[snip]";
            buffer = "[buffer]";
            orgmode = "[orgmode]";
            neorg = "[neorg]";
          };
        };
      };

      lsp-lines.enable = true;
      luasnip.enable = true;
      cmp_luasnip.enable = true;
      cmp-nvim-lsp.enable = true;

      nvim-cmp = {
        enable = true;
        snippet.expand = "luasnip";
        window.completion.border = [ "" "" "" "" "" "" "" "" ];
        mapping = {
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.close()";
          "<Tab>" = {
            modes = [ "i" "s" ];
            action = "cmp.mapping.select_next_item()";
          };
          "<S-Tab>" = {
            modes = [ "i" "s" ];
            action = "cmp.mapping.select_prev_item()";
          };
          "<Down>" = {
            modes = [ "i" "s" ];
            action = "cmp.mapping.select_next_item()";
          };
          "<Up>" = {
            modes = [ "i" "s" ];
            action = "cmp.mapping.select_prev_item()";
          };
          "<C-j>" = {
            modes = [ "i" "s" ];
            action = "cmp.mapping.select_next_item()";
          };
          "<C-k>" = {
            modes = [ "i" "s" ];
            action = "cmp.mapping.select_prev_item()";
          };
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          # "<Tab>" = "cmp.mapping.confirm({ select = true })";
        };
        sources = [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          { name = "path"; }
          { name = "buffer"; }
          { name = "nvim_lua"; }
          { name = "orgmode"; }
          { name = "neorg"; }
        ];
      };
    };
    extraPlugins = with pkgs.vimPlugins; [
      luasnip
      friendly-snippets
      orgmode
      vim-table-mode
      vim-cool
      # codeium-vim
      (pkgs.vimUtils.buildVimPlugin rec {
        pname = "scope-nvim";
        version = "cd27af77ad61a7199af5c28d27013fb956eb0e3e";
        src = pkgs.fetchFromGitHub {
          owner = "tiagovla";
          repo = "scope.nvim";
          rev = version;
          sha256 = "sha256-z1ytdhxKrLnZG8qMPEe2h+wC9tF4K/x6zplwnIojZuE=";
        };
      })
      (pkgs.vimUtils.buildVimPlugin rec {
        pname = "org-bullets.nvim";
        version = "6e0d60e901bb939eb526139cb1f8d59065132fd9";
        src = pkgs.fetchFromGitHub {
          owner = "akinsho";
          repo = "org-bullets.nvim";
          rev = version;
          sha256 = "sha256-x6S4WdgfUr7HGEHToSDy3pSHEwOPQalzWhBUipqMtnw=";
        };
      })
    ];
  };
}
