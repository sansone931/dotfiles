--- mfussenegger/nvim-dap
local M = {}

function M.setup()
  local dap = require("dap")

  dap.defaults.fallback.external_terminal = {
    command = "/usr/bin/alacritty",
    args = { "-e" },
  }

  require("keymaps.nvim-dap").setup()
end

return M
