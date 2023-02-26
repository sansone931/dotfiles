--- theHamsta/nvim-dap-virtual-text
local M = {}

function M.setup()
  vim.keymap.set(
    "n",
    "<Leader>dv",
    "<Cmd>DapVirtualTextToggle<CR>",
    { desc = "Toggle virtual text" }
  )

  vim.keymap.set(
    "n",
    "<Leader>dV",
    "<Cmd>DapVirtualTextForceRefresh<CR>",
    { desc = "Refresh virtual text" }
  )
end

return M
