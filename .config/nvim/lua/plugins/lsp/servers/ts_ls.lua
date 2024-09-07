--- ts_ls
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ts_ls
local M = {}

function M.setup()
  require("lspconfig").ts_ls.setup({
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    on_attach = function(client)
      client.server_capabilities.documentFormattingProvider = false
    end,
  })
end

return M
