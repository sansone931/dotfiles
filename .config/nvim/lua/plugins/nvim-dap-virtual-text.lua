--- theHamsta/nvim-dap-virtual-text
-- @module plugins.nvim-dap-virtual-text
local M = {}

function M.setup()
  vim.g.dap_virtual_text = true
end

return M
