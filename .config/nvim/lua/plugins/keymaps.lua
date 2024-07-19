return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")

      wk.setup({
        delay = 500,
        plugins = {
          presets = {
            operators = false, -- adds help for operators like d, y, ...
            motions = false, -- adds help for motions
            text_objects = false, -- help for text objects triggered after entering an operator
          },
        },
        win = {
          border = "single", -- none, single, double, shadow
        },
      })

      wk.add({
        { "<Leader>b", group = "buffers" },
        { "<Leader>d", group = "debug" },
        { "<Leader>f", group = "telescope" },
        { "<Leader>g", group = "git", mode = { "n", "x" } },
        { "<Leader>l", group = "lsp" },
      })
    end,
  },

  {
    "tpope/vim-unimpaired",
    event = "VeryLazy",
  },

  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = true,
  },
}
