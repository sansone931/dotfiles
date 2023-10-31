--- astro
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#astro
local M = {}

function M.setup()
  require("lspconfig").astro.setup({
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
  })
end

return M
