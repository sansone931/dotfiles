--- lewis6991/gitsigns.nvim
local M = {}

function M.setup()
  require("gitsigns").setup()
  require("mappings.gitsigns").setup()
end

return M
