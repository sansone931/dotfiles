--- astro
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#astro
local M = {}

function M.setup()
  vim.lsp.config("astro", {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
  })

  vim.lsp.enable("astro")
end

return M
