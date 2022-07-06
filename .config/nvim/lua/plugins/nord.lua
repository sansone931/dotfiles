--- shaunsingh/nord.nvim
-- @module plugins.nord
local M = {}

function M.setup()
  vim.g.nord_contrast = true
  vim.g.nord_borders = true

  vim.cmd([[colorscheme nord]])
end

return M
