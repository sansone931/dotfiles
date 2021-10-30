--- kyazdani42/nvim-tree.lua
-- @module mappings.nvim-tree
local M = {}

function M.setup()
  local wk = require("which-key")

  wk.register({
    e = { "<Cmd>NvimTreeToggle<CR>", "toggle explorer" },
  }, { prefix = "<Leader>" })
end

return M
