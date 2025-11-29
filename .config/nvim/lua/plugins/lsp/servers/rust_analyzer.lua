--- rust_analyzer
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
local M = {}

function M.setup()
  vim.lsp.config("rust_analyzer", {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    settings = {
      ["rust-analyzer"] = {
        check = {
          command = "clippy",
        },
      },
    },
  })

  vim.lsp.enable("rust_analyzer")
end

return M
