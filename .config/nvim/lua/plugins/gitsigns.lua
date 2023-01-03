--- lewis6991/gitsigns.nvim
local M = {}

function M.setup()
  require("gitsigns").setup()
  require("keymaps.gitsigns").setup()
end

return M
