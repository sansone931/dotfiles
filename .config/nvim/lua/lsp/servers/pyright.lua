--- @module lsp.servers.pyright
local M = {}

function M.setup()
  require("lspconfig").pyright.setup({
    capabilities = require("plugins.nvim-cmp").capabilities,
  })
end

return M
