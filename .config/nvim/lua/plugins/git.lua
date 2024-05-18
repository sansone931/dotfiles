return {
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
    dependencies = { "tpope/vim-rhubarb" },
    keys = {
      { "<Leader>gd", "<Cmd>Gdiffsplit!<CR>", desc = "Diff split" },
      { "<Leader>gB", "<Cmd>Git blame<CR>", desc = "Blame" },
      { "<Leader>ge", "<Cmd>Gedit<CR>", desc = "Edit" },
      { "<Leader>gE", ":Gedit ", desc = "Edit (prompt)" },
      { "<Leader>gg", "<Cmd>Git<CR>", desc = "Status" },
      { "<Leader>gh", "<Cmd>0Gclog<CR>", desc = "File commit history" },
      { "<Leader>gl", "<Cmd>Git log<CR>", desc = "Log" },
      { "<Leader>gL", ":Git log ", desc = "Log (prompt)" },
      { "<Leader>gx", ":0GBrowse!<CR>", mode = { "n", "x" }, desc = "Open in browser" },
      { "<Leader>gX", ":0GBrowse! :%<C-Left>", mode = { "n", "x" }, desc = "Open in browser (prompt)" },
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    cmd = "Gitsigns",
    keys = function()
      local ok, gitsigns = pcall(require, "gitsigns")

      if not ok then
        return
      end

      local prev_hunk = function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          gitsigns.nav_hunk("prev")
        end
      end

      local next_hunk = function()
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          gitsigns.nav_hunk("next")
        end
      end

      local blame_line = function()
        gitsigns.blame_line({ full = true })
      end

      local stage_hunk_visual = function()
        gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end

      local reset_hunk_visual = function()
        gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end

      return {
        { "[c", prev_hunk, mode = { "n", "x" }, desc = "Previous hunk" },
        { "]c", next_hunk, mode = { "n", "x" }, desc = "Next hunk" },
        { "ah", ":<C-U>Gitsigns select_hunk<CR>", mode = { "o", "x" }, desc = "Select hunk" },
        { "ih", ":<C-U>Gitsigns select_hunk<CR>", mode = { "o", "x" }, desc = "Select hunk" },
        { "<Leader>gs", gitsigns.stage_hunk, desc = "Stage hunk" },
        { "<Leader>gS", gitsigns.stage_buffer, desc = "Stage buffer" },
        { "<Leader>gu", gitsigns.undo_stage_hunk, desc = "Undo stage hunk" },
        { "<Leader>gp", gitsigns.preview_hunk, desc = "Preview hunk" },
        { "<Leader>gr", gitsigns.reset_hunk, desc = "Reset hunk" },
        { "<Leader>gR", gitsigns.reset_buffer, desc = "Reset buffer" },
        { "<Leader>gb", blame_line, desc = "Blame line" },
        { "<Leader>gs", stage_hunk_visual, mode = "x", desc = "Stage hunk" },
        { "<Leader>gr", reset_hunk_visual, mode = "x", desc = "Reset hunk" },
      }
    end,
    config = true,
  },
}
