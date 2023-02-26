--- lewis6991/gitsigns.nvim
local M = {}

function M.setup()
  local gitsigns = require("gitsigns")
  local actions = require("gitsigns.actions")

  vim.keymap.set("n", "[g", actions.prev_hunk, { desc = "Previous hunk" })
  vim.keymap.set("n", "]g", actions.next_hunk, { desc = "Next hunk" })
  vim.keymap.set("o", "ih", actions.select_hunk, { desc = "Select hunk" })
  vim.keymap.set("x", "ih", actions.select_hunk, { desc = "Select hunk" })

  vim.keymap.set(
    "n",
    "<Leader>gs",
    gitsigns.stage_hunk,
    { desc = "Stage hunk" }
  )

  vim.keymap.set(
    "n",
    "<Leader>gu",
    gitsigns.undo_stage_hunk,
    { desc = "Undo stage hunk" }
  )

  vim.keymap.set(
    "n",
    "<Leader>gp",
    gitsigns.preview_hunk,
    { desc = "Preview hunk" }
  )

  vim.keymap.set(
    "n",
    "<Leader>gr",
    gitsigns.reset_hunk,
    { desc = "Reset hunk" }
  )

  vim.keymap.set(
    "n",
    "<Leader>gR",
    gitsigns.reset_buffer,
    { desc = "Reset buffer" }
  )

  vim.keymap.set("n", "<Leader>gb", function()
    gitsigns.blame_line({ full = true })
  end, { desc = "Blame line" })

  vim.keymap.set("x", "<Leader>gs", function()
    gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
  end, { desc = "Stage hunk" })

  vim.keymap.set("x", "<Leader>gr", function()
    gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
  end, { desc = "Reset hunk" })
end
return M
