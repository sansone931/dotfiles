--- hoob3rt/lualine.nvim
local M = {}

function M.setup()
  require("lualine").setup({
    extensions = { "fugitive", "nvim-tree" },
  })
end

return M
