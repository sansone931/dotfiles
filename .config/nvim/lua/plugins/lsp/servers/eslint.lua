--- eslint
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#eslint
local M = {}

function M.setup()
  require("lspconfig").eslint.setup({
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    on_attach = function(client)
      client.server_capabilities.documentFormattingProvider = true
    end,
  })
end

return M
