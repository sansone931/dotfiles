--- numToStr/Comment.nvim
local M = {}

function M.setup()
  vim.keymap.set("n", "<Leader>/", function()
    return vim.v.count == 0 and "<Plug>(comment_toggle_linewise_current)"
      or "<Plug>(comment_toggle_linewise_count)"
  end, { expr = true, desc = "Toggle comment" })

  vim.keymap.set(
    "x",
    "<Leader>/",
    "<Plug>(comment_toggle_linewise_visual)",
    { desc = "Toggle comment" }
  )
end

return M
