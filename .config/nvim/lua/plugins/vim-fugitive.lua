--- tpope/vim-fugitive
local M = {}

function M.setup()
  require("keymaps.vim-fugitive").setup()
end

return M
