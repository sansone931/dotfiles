local plugins = {
  { "wbthomason/packer.nvim" },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.nvim-lspconfig").setup()
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("plugins.null-ls").setup()
    end,
  },
  { "L3MON4D3/LuaSnip" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require("plugins.nvim-cmp").setup()
    end,
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("plugins.nvim-autopairs").setup()
    end,
  },
  {
    "gruvbox-community/gruvbox",
    after = { "quick-scope", "gitsigns.nvim" },
    config = function()
      require("plugins.gruvbox").setup()
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("plugins.nvim-colorizer").setup()
    end,
  },
  { "kyazdani42/nvim-web-devicons" },
  {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("plugins.nvim-tree").setup()
    end,
  },
  {
    "hoob3rt/lualine.nvim",
    config = function()
      require("plugins.lualine").setup()
    end,
  },
  {
    "romgrk/barbar.nvim",
    config = function()
      require("plugins.barbar").setup()
    end,
  },
  { "nvim-lua/popup.nvim" },
  { "nvim-lua/plenary.nvim" },
  { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("plugins.telescope").setup()
    end,
  },
  {
    "folke/which-key.nvim",
    config = function()
      require("plugins.which-key").setup()
    end,
  },
  {
    "unblevable/quick-scope",
    config = function()
      require("plugins.quick-scope").setup()
    end,
  },
  { "JoosepAlviste/nvim-ts-context-commentstring" },
  {
    "terrortylor/nvim-comment",
    config = function()
      require("plugins.nvim-comment").setup()
    end,
  },
  {
    "tpope/vim-fugitive",
    config = function()
      require("plugins.vim-fugitive").setup()
    end,
  },
  { "tpope/vim-rhubarb" },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("plugins.gitsigns").setup()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("plugins.nvim-treesitter").setup()
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("plugins.nvim-dap").setup()
    end,
  },
  {
    "Pocco81/DAPInstall.nvim",
    commit = "24923c3819a450a772bb8f675926d530e829665f",
    config = function()
      require("plugins.dapinstall").setup()
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("plugins.nvim-dap-virtual-text").setup()
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("plugins.nvim-dap-ui").setup()
    end,
  },
}

--- @module plugins
local M = {}

function M.setup()
  -- {{{ Install packer.nvim automatically if it isn't already installed
  local install_path = vim.fn.stdpath("data")
    .. "/site/pack/packer/start/packer.nvim"

  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({
      "git",
      "clone",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    })

    vim.cmd([[packadd packer.nvim]])
  end
  -- }}}

  -- Load plugins
  require("packer").startup(function(use)
    use(plugins)
  end)
end

return M