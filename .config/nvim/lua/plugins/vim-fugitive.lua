--- tpope/vim-fugitive
-- @module plugins.vim-fugitive
local M = {}

function M.setup()
  require("mappings.vim-fugitive").setup()
end

return M
