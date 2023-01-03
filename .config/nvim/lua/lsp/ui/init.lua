--- lsp ui
local M = {}

function M.setup()
  require("lsp.ui.sign-column").setup()
  require("lsp.ui.diagnostics").setup()
end

return M
