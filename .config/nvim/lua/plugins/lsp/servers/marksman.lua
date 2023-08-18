--- marksman
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#marksman
local M = {}

function M.setup()
  require("lspconfig").marksman.setup({
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
  })
end

return M
