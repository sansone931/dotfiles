--- html
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#html
local M = {}

function M.setup()
  vim.lsp.config("html", {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    init_options = {
      provideFormatter = false,
    },
  })

  vim.lsp.enable("html")
end

return M
