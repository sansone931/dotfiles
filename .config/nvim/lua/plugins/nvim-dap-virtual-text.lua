--- theHamsta/nvim-dap-virtual-text
-- @module plugins.nvim-dap-virtual-text
local nvim_dap_virtual_text = {}

function nvim_dap_virtual_text.setup()
  vim.g.dap_virtual_text = true
end

return nvim_dap_virtual_text
