-- Source Vim configuration file. By keeping the "generic" config in
-- Vim Script, we can re-use the same file for Vim and IdeaVim.
vim.cmd.source(vim.fs.joinpath(vim.fn.stdpath("config"), "vimrc.vim"))

-- Highlight-on-yank.
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end
})

--- Plugins ---

-- Bootstrap lazy.nvim.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
-- vim.g.mapleader = " " -- Set in `vimrc.vim`.
-- vim.g.maplocalleader = "\\"

-- Setup lazy.nvim.
require("lazy").setup({
  spec = {
    -- add your plugins here

    -- `fzf` integration (`:Files`, `:Rg`).
    { "junegunn/fzf" },
    {
      "junegunn/fzf.vim",
      config = function()
        vim.keymap.set("", "<Leader>p", "<cmd>Files<cr>")
        vim.keymap.set("", "<Leader>f", "<cmd>Rg<cr>")
        -- Reduce size of pop-up.
        -- vim.g.fzf_layout = { down = "~25%" }
        -- When using :Files, pass the file list through
        --   https://github.com/jonhoo/proximity-sort
        -- to prefer files closer to the current file.
        function list_cmd()
          local base = vim.fn.fnamemodify(vim.fn.expand("%"), ":h:.:S")
          if base == "." then
            -- If there is no current file,
            -- proximity-sort can't do its thing
            return "fd --hidden --type file --follow"
          else
            return vim.fn.printf("fd --hidden --type file --follow | proximity-sort %s", vim.fn.shellescape(vim.fn.expand("%")))
          end
        end
        vim.api.nvim_create_user_command("Files", function(arg)
          vim.fn["fzf#vim#files"](arg.qargs, { source = list_cmd(), options = "--scheme=path --tiebreak=index" }, arg.bang)
        end, { bang = true, nargs = "?", complete = "dir" })
      end
    },

    -- Git integration (`:Gitsigns`).
    {
      "lewis6991/gitsigns.nvim",
      config = function()
        require("gitsigns").setup()
      end
    },

    -- Indent guides.
    {
      "nvimdev/indentmini.nvim",
      lazy = false,
      config = function()
        require("indentmini").setup()
        vim.cmd.highlight("IndentLine guifg=#333333")
        vim.cmd.highlight("IndentLineCurrent guifg=#555555")
      end
    },

    -- Quick navigation.
    {
      "ggandor/leap.nvim",
      config = function()
        require("leap").create_default_mappings()
        -- Bidirectional `s`.
        vim.keymap.set({"n", "x"}, "s", "<Plug>(leap)")
        vim.keymap.set("n",        "S", "<Plug>(leap-from-window)")
        vim.keymap.set("o",        "s", "<Plug>(leap-forward)")
        vim.keymap.set("o",        "S", "<Plug>(leap-backward)")
      end
    },

    -- -- Nice status bar.
    -- {
    --   "itchyny/lightline.vim",
    --   lazy = false,
    --   config = function()
    --     vim.o.showmode = false -- Redundant.
    --   end
    -- },

    -- Auto-`cd` to Git root.
    {
      "notjedi/nvim-rooter.lua",
      config = function()
        require("nvim-rooter").setup()
      end
    },

    -- File tree.
    {
      "nvim-tree/nvim-tree.lua",
      config = function()
        vim.keymap.set("", "<Leader><Tab>", "<cmd>NvimTreeToggle<cr>")
        require("nvim-tree").setup()
      end
    },

    -- Reopen files at last edit position.
    { "farmergreg/vim-lastplace", lazy = false },

    -- Wakatime time tracking (`:WakaTime[Today]`).
    { "wakatime/vim-wakatime", lazy = false },

    -- More subtle column rulers.
    {
        "lukas-reineke/virt-column.nvim",
        lazy = false,
        opts = {
            char = "│"
        }
    },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  -- install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
