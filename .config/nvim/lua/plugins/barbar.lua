--- romgrk/barbar.nvim
local M = {}

function M.setup()
  require("bufferline").setup({
    highlight_visible = false,
    icon_pinned = "󰐃",
  })

  require("keymaps.barbar").setup()
end

return M
