--- romgrk/barbar.nvim
-- @module plugins.barbar
local M = {}

function M.setup()
  require("mappings.barbar").setup()
end

return M
