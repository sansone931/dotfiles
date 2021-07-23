local plugins = {
  "wbthomason/packer.nvim",
  {"neoclide/coc.nvim", branch = "release"},
  "morhetz/gruvbox",
  "norcalli/nvim-colorizer.lua",
  "vim-airline/vim-airline",
  "kyazdani42/nvim-web-devicons",
  "kyazdani42/nvim-tree.lua",
  "romgrk/barbar.nvim",
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope.nvim",
  "liuchengxu/vim-which-key",
  "unblevable/quick-scope",
  "tpope/vim-commentary",
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  "junegunn/gv.vim",
  "airblade/vim-gitgutter",
  "sheerun/vim-polyglot",
  {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"},
  "puremourning/vimspector",
}

-- {{{ Install packer.nvim automatically if it isn't already installed
local install_path = vim.fn.stdpath("data") ..
  "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({
    "git",
    "clone",
    "https://github.com/wbthomason/packer.nvim",
    install_path
  })

  vim.cmd [[packadd packer.nvim]]
end
-- }}}

-- Load plugins
require("packer").startup(function(use)
  for _, plugin in ipairs(plugins) do
    use(plugin)
  end
end)

-- {{{ Plugin configuration

-- neoclide/coc.nvim
require("plugins/coc")

-- morhetz/gruvbox
require("plugins/gruvbox")

-- norcalli/nvim-colorizer.lua
require("plugins/nvim-colorizer")

-- vim-airline/vim-airline
require("plugins/vim-airline")

-- kyazdani42/nvim-tree.lua
require("plugins/nvim-tree")

-- nvim-telescope/telescope.nvim
require("plugins/telescope")

-- unblevable/quick-scope
require("plugins/quick-scope")

-- airblade/vim-gitgutter
require("plugins/vim-gitgutter")

-- nvim-treesitter/nvim-treesitter
require("plugins/nvim-treesitter")

-- puremourning/vimspector
require("plugins/vimspector")

-- }}}
