--- cssls
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#cssls
local M = {}

function M.setup()
  vim.lsp.config("cssls", {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    init_options = {
      provideFormatter = false,
    },
  })

  vim.lsp.enable("cssls")
end

return M
