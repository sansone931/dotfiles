--- windwp/nvim-autopairs
-- @module plugins.nvim-autopairs
local M = {}

function M.setup()
  require("nvim-autopairs").setup()

  require("nvim-autopairs.completion.compe").setup({
    map_cr = true, --  map <CR> on insert mode
    map_complete = true, -- it will auto insert `(` after select function or method item
    auto_select = false, -- auto select first item
  })
end

return M
