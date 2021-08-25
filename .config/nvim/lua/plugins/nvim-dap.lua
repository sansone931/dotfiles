--- mfussenegger/nvim-dap
-- @module plugins.nvim-dap
local M = {}

function M.setup()
  local dap = require("dap")

  dap.defaults.fallback.external_terminal = {
    command = "/usr/bin/alacritty",
    args = { "-e" },
  }

  require("mappings.nvim-dap").setup()
end

return M
