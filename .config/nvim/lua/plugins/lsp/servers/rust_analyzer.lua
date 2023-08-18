--- rust_analyzer
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
local M = {}

function M.setup()
  require("lspconfig").rust_analyzer.setup({
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    settings = {
      ["rust-analyzer"] = {
        check = {
          command = "clippy",
        },
      },
    },
  })
end

return M
