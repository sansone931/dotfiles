local plugins = {
  {
    "williamboman/mason.nvim",
    config = function()
      require("plugins.mason").setup()
    end,
  },
  { "williamboman/mason-lspconfig.nvim" },
  { "jay-babu/mason-null-ls.nvim" },
  { "jayp0521/mason-nvim-dap.nvim" },
  { "folke/neodev.nvim" },
  { "b0o/schemastore.nvim" },
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
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("plugins.nvim-dap").setup()
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("plugins.nvim-dap-ui").setup()
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("plugins.nvim-dap-virtual-text").setup()
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
  { "windwp/nvim-ts-autotag" },
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
  {
    "stevearc/dressing.nvim",
    config = function()
      require("plugins.dressing").setup()
    end,
  },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("plugins.telescope").setup()
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  { "JoosepAlviste/nvim-ts-context-commentstring" },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("plugins.comment").setup()
    end,
  },
  { "nvim-treesitter/nvim-treesitter-textobjects" },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("plugins.nvim-treesitter").setup()
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
  { "tpope/vim-unimpaired" },
  {
    "folke/which-key.nvim",
    config = function()
      require("plugins.which-key").setup()
    end,
  },
  {
    "unblevable/quick-scope",
    init = function()
      require("plugins.quick-scope").setup()
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("plugins.nvim-colorizer").setup()
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("plugins.indent-blankline").setup()
    end,
  },
  {
    "gruvbox-community/gruvbox",
    config = function()
      require("plugins.gruvbox").setup()
    end,
  },
  {
    "shaunsingh/nord.nvim",
    config = function()
      require("plugins.nord").setup()
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("tokyonight")
    end,
  },
}

local M = {}

function M.setup()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable",
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)

  require("lazy").setup(plugins)
end

return M
