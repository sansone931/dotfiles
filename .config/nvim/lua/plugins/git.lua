return {
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
    keys = {
      { "<Leader>gd", "<Cmd>Gdiffsplit!<CR>", desc = "Diff split" },
      { "<Leader>gB", "<Cmd>Git blame<CR>", desc = "Blame" },
      { "<Leader>gg", "<Cmd>Git<CR>", desc = "Status" },
      { "<Leader>gh", "<Cmd>0Gclog<CR>", desc = "File commit history" },
      { "<Leader>gl", "<Cmd>Git log<CR>", desc = "Log" },
      { "<Leader>gx", "<Cmd>GBrowse<CR>", desc = "Open in browser" },
    },
  },

  {
    "tpope/vim-rhubarb",
    event = "VeryLazy",
  },

  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    keys = function()
      local gitsigns = require("gitsigns")
      local actions = require("gitsigns.actions")

      return {
        { "[g", actions.prev_hunk, desc = "Previous hunk" },
        { "]g", actions.next_hunk, desc = "Next hunk" },
        { "ih", actions.select_hunk, mode = { "o", "x" }, desc = "Select hunk" },
        { "<Leader>gs", gitsigns.stage_hunk, desc = "Stage hunk" },
        { "<Leader>gu", gitsigns.undo_stage_hunk, desc = "Undo stage hunk" },
        { "<Leader>gp", gitsigns.preview_hunk, desc = "Preview hunk" },
        { "<Leader>gr", gitsigns.reset_hunk, desc = "Reset hunk" },
        { "<Leader>gR", gitsigns.reset_buffer, desc = "Reset buffer" },
        {
          "<Leader>gb",
          function()
            gitsigns.blame_line({ full = true })
          end,
          desc = "Blame line",
        },
        {
          "<Leader>gs",
          function()
            gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end,
          mode = "x",
          desc = "Stage hunk",
        },
        {
          "<Leader>gr",
          function()
            gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end,
          mode = "x",
          desc = "Reset hunk",
        },
      }
    end,
    config = true,
  },
}
