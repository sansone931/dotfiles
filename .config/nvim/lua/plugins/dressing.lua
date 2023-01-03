--- stevearc/dressing.nvim
local M = {}

function M.setup()
  require("dressing").setup({
    input = {
      insert_only = false,
      win_options = {
        winblend = 0,
      },
    },
  })
end

return M
