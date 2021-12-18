--- hoob3rt/lualine.nvim
-- @module plugins.lualine
local M = {}

function M.setup()
  require("lualine").setup({
    extensions = { "fugitive", "nvim-tree" },
  })
end

return M
