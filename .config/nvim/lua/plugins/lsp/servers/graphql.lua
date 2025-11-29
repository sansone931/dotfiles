--- graphql
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#graphql
local M = {}

function M.setup()
  vim.lsp.config("graphql", {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    filetypes = { "graphql", "typescript", "typescriptreact" },
  })

  vim.lsp.enable("graphql")
end

return M
