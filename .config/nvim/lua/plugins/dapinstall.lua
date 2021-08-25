--- Pocco81/DAPInstall.nvim
-- @module plugins.dapinstall
local M = {}

function M.setup()
  local dap_install = require("dap-install")
  local dbg_list = require("dap-install.debuggers_list").debuggers

  for debugger, _ in pairs(dbg_list) do
    dap_install.config(debugger, {})
  end
end

return M
