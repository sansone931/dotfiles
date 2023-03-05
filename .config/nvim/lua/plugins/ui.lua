return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    opts = {
      extensions = { "fugitive", "nvim-tree" },
    },
  },

  {
    "romgrk/barbar.nvim",
    event = "VeryLazy",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    keys = {
      { "<A-h>", "<Cmd>BufferPrevious<CR>", desc = "Previous buffer" },
      { "<A-l>", "<Cmd>BufferNext<CR>", desc = "Next buffer" },
      { "<A-H>", "<Cmd>BufferMovePrevious<CR>", desc = "Move buffer to the left" },
      { "<A-L>", "<Cmd>BufferMoveNext<CR>", desc = "Move buffer to the right" },
      { "<A-1>", "<Cmd>BufferGoto 1<CR>", desc = "Go to buffer 1" },
      { "<A-2>", "<Cmd>BufferGoto 2<CR>", desc = "Go to buffer 2" },
      { "<A-3>", "<Cmd>BufferGoto 3<CR>", desc = "Go to buffer 3" },
      { "<A-4>", "<Cmd>BufferGoto 4<CR>", desc = "Go to buffer 4" },
      { "<A-5>", "<Cmd>BufferGoto 5<CR>", desc = "Go to buffer 5" },
      { "<A-6>", "<Cmd>BufferGoto 6<CR>", desc = "Go to buffer 6" },
      { "<A-7>", "<Cmd>BufferGoto 7<CR>", desc = "Go to buffer 7" },
      { "<A-8>", "<Cmd>BufferGoto 8<CR>", desc = "Go to buffer 8" },
      { "<A-9>", "<Cmd>BufferGoto 9<CR>", desc = "Go to buffer 9" },
      { "<A-0>", "<Cmd>BufferLast<CR>", desc = "Go to last buffer" },
      { "<A-p>", "<Cmd>BufferPin<CR>", desc = "Toggle buffer pin" },
      { "<A-P>", "<Cmd>BufferCloseAllButPinned<CR>", desc = "Close all but pinned buffers" },
      { "<A-q>", "<Cmd>BufferClose<CR>", desc = "Close buffer" },
      { "<Leader>bc", "<Cmd>BufferClose!<CR>", desc = "Close buffer (force)" },
      { "<Leader>bD", "<Cmd>BufferOrderByDirectory<CR>", desc = "Sort buffers by directory" },
      { "<Leader>be", "<Cmd>BufferCloseAllButCurrent<CR>", desc = "Close all but current buffer" },
      { "<Leader>bh", "<Cmd>BufferCloseBuffersLeft<CR>", desc = "Close all buffers to the left" },
      { "<Leader>bj", "<Cmd>BufferPick<CR>", desc = "Jump to buffer" },
      { "<Leader>bl", "<Cmd>BufferCloseBuffersRight<CR>", desc = "Close all buffers to the right" },
      { "<Leader>bL", "<Cmd>BufferOrderByLanguage<CR>", desc = "Sort buffers by language" },
      { "<Leader>bp", "<Cmd>BufferPin<CR>", desc = "Toggle buffer pin" },
      { "<Leader>bP", "<Cmd>BufferCloseAllButPinned<CR>", desc = "Close all but pinned buffers" },
    },
    opts = {
      highlight_visible = false,
      icon_pinned = "󰐃",
    },
  },

  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {
      input = {
        insert_only = false,
        win_options = {
          winblend = 0,
        },
      },
    },
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    keys = function()
      local fold_keymaps = { "zo", "zO", "zc", "zC", "za", "zA", "zv", "zx", "zX", "zm", "zM", "zr", "zR" }

      for _, keymap in pairs(fold_keymaps) do
        vim.keymap.set({ "n", "x" }, keymap, keymap .. "<Cmd>IndentBlanklineRefresh<CR>")
      end

      return {
        { "<Leader>i", "<Cmd>IndentBlanklineToggle!<CR>", desc = "Toggle indent guides" },
      }
    end,
    opts = {
      show_current_context = true,
      use_treesitter_scope = true,
      show_trailing_blankline_indent = false,
    },
  },

  {
    "norcalli/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("colorizer").setup()
    end,
  },
}
