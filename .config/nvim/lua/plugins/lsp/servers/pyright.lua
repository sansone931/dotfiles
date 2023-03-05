--- pyright
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pyright
local M = {}

function M.setup()
  require("lspconfig").pyright.setup({
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
  })
end

return M
