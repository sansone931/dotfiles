--- gruvbox-community/gruvbox
-- @module plugins.gruvbox
local M = {}

function M.setup()
  vim.g.gruvbox_italic = 1
  vim.g.gruvbox_invert_selection = 0

  vim.cmd([[colorscheme gruvbox]])
end

return M
