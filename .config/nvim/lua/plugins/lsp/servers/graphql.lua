--- graphql
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#graphql
local M = {}

function M.setup()
  require("lspconfig").graphql.setup({
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    filetypes = { "graphql", "typescript", "typescriptreact" },
  })
end

return M
