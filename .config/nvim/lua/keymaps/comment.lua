--- numToStr/Comment.nvim
local M = {}

function M.setup()
  local api = require("Comment.api")

  vim.keymap.set("n", "<Leader>/", function()
    if vim.v.count == 0 then
      api.toggle.linewise.current()
    else
      api.toggle.linewise.count(vim.v.count)
    end
  end, { desc = "Toggle comment" })

  local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)

  vim.keymap.set("x", "<Leader>/", function()
    vim.api.nvim_feedkeys(esc, "nx", false)
    api.toggle.linewise(vim.fn.visualmode())
  end, { desc = "Toggle comment" })
end

return M
