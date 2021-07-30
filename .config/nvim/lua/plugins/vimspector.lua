--- puremourning/vimspector
-- @module plugins.vimspector
local vimspector = {}

function vimspector.setup()
  vim.g.vimspector_install_gadgets = {
    "debugger-for-chrome",
    "vscode-node-debug2",
    "debugpy",
  }
end

return vimspector
