--- @module lsp.servers.pyright
local M = {}

function M.setup()
  require("lspconfig").pyright.setup({})
end

return M
