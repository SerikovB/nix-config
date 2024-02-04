{ ... }: {
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    keymaps = [
      {
        mode = [ "i" "n" "v" ];
        key = "<C-s>";
        action = "<CMD>w<CR>";
        options.desc = "Save";
      }
      {
        key = "<leader>s";
        action = "<CMD>w<CR>";
        options.desc = "Save";
      }
      {
        key = "<leader>ni";
        action = "<CMD>Neorg index<CR>";
        options.desc = "Open neorg index file";
      }
      {
        key = "<leader>nr";
        action = "<CMD>Neorg return<CR>";
        options.desc = "Return from neorg file";
      }
      {
        key = "<leader>q";
        action = "<CMD>q<CR>";
        options.desc = "quit";
      }
      {
        key = "<F2>";
        action = "<CMD>Neotree toggle<CR>";
        options.desc = "Toggle NeoTree";
      }
      {
        key = "<leader>e";
        action = "<CMD>Neotree toggle<CR>";
        options.desc = "Toggle NeoTree";
      }
      {
        key = "<leader>fs";
        action = "<CMD>Neotree toggle<CR>";
        options.desc = "Toggle NeoTree";
      }
      {
        key = "<F3>";
        action = "<CMD>UndotreeToggle<CR>";
        options.desc = "Toggle Undotree";
      }
      {
        key = "<leader>sh";
        action = "<C-w>s";
        options.desc = "Split Horizontal";
      }
      {
        key = "<leader>sv";
        action = "<C-w>v";
        options.desc = "Split Vertical";
      }
      {
        key = "<leader><Left>";
        action = "<C-w>h";
        options.desc = "Select Window Left";
      }
      {
        key = "<leader>h";
        action = "<C-w>h";
        options.desc = "Select Window Left";
      }
      {
        key = "<leader><Right>";
        action = "<C-w>l";
        options.desc = "Select Window Right";
      }
      {
        key = "<leader>l";
        action = "<C-w>l";
        options.desc = "Select Window Right";
      }
      {
        key = "<leader><Down>";
        action = "<C-w>j";
        options.desc = "Select Window Below";
      }
      {
        key = "<leader>j";
        action = "<C-w>j";
        options.desc = "Select Window Below";
      }
      {
        key = "<leader><Up>";
        action = "<C-w>k";
        options.desc = "Select Window Above";
      }
      {
        key = "<leader>k";
        action = "<C-w>k";
        options.desc = "Select Window Above";
      }
      {
        key = "<leader>t";
        action = "<C-w>w";
        options.desc = "Cycle Between Windows";
      }
      {
        key = "<leader>bb";
        action = "<CMD>BufferPick<CR>";
        options.desc = "View Open Buffer";
      }
      {
        key = "<leader>bc";
        action = "<CMD>BufferClose<CR>";
        options.desc = "View Open Buffer";
      }
      {
        key = "<leader>bn";
        action = "<CMD>:bnext<CR>";
        options.desc = "Next Buffer";
      }
      {
        key = "<leader>bp";
        action = "<CMD>:bprev<CR>";
        options.desc = "Previous Buffer";
      }
      {
        mode = "v";
        key = "<";
        action = "<gv";
        options.desc = "Tab Text Right";
      }
      {
        mode = "v";
        key = ">";
        action = ">gv";
        options.desc = "Tab Text Left";
      }
      {
        mode = "n";
        key = "<C-/>";
        action = "<Plug>(comment_toggle_linewise_current)";
        options.desc = "(Un)comment in Normal Mode";
      }
      {
        mode = "v";
        key = "<C-/>";
        action = "<Plug>(comment_toggle_linewise_visual)";
        options.desc = "(Un)comment in Visual Mode";
      }
      {
        mode = "n";
        key = "<C-S-/>";
        action = "<Plug>(comment_toggle_blockwise_current)";
        options.desc = "(Un)comment in Normal Mode";
      }
      {
        mode = "v";
        key = "<C-S-/>";
        action = "<Plug>(comment_toggle_blockwise_visual)";
        options.desc = "(Un)comment in Visual Mode";
      }
      {
        mode = "n";
        key = "gd";
        action = "<CMD>lua vim.lsp.buf.hover()<CR>";
      }
      {
        mode = "n";
        key = "gD";
        action = "<CMD>lua vim.lsp.buf.definition()<CR>";
      }
      {
        mode = "n";
        key = "ge";
        action = "<CMD>lua vim.diagnostic.open_float()<CR>";
      }
      {
        mode = "n";
        key = "<leader>r";
        action = ":! ";
      }
      {
        mode = "i";
        key = "jh";
        action = "<ESC>";
      }
    ];
  };
}
