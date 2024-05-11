--- cssls
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#cssls
local M = {}

function M.setup()
  require("lspconfig").cssls.setup({
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    init_options = {
      provideFormatter = false,
    },
  })
end

return M
