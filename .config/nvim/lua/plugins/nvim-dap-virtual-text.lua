--- theHamsta/nvim-dap-virtual-text
local M = {}

function M.setup()
  require("nvim-dap-virtual-text").setup()
  require("keymaps.nvim-dap-virtual-text").setup()
end

return M
