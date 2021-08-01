--- mfussenegger/nvim-dap
-- @module plugins.nvim-dap
local nvim_dap = {}

function nvim_dap.setup()
  local dap = require("dap")

  dap.defaults.fallback.external_terminal = {
    command = "/usr/bin/alacritty",
    args = {"-e"},
  }
end

return nvim_dap
