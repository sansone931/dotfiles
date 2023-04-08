return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")

      wk.setup({
        plugins = {
          spelling = {
            enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          },
          presets = {
            operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = false, -- adds help for motions
            text_objects = false, -- help for text objects triggered after entering an operator
          },
        },
        window = {
          border = "single", -- none, single, double, shadow
        },
      })

      wk.register({
        ["<Leader>b"] = { name = "buffers" },
        ["<Leader>d"] = { name = "debug" },
        ["<Leader>f"] = { name = "telescope" },
        ["<Leader>g"] = { name = "git" },
        ["<Leader>l"] = { name = "lsp" },
      })

      wk.register({
        ["<Leader>g"] = { name = "git" },
      }, { mode = "x" })
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
