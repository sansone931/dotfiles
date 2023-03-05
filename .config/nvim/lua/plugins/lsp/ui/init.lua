--- lsp ui
local M = {}

function M.setup()
  require("plugins.lsp.ui.sign-column").setup()
  require("plugins.lsp.ui.diagnostics").setup()
end

return M
