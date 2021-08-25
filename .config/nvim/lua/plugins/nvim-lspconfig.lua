--- neovim/nvim-lspconfig
-- @module plugins.nvim-lspconfig
local M = {}

function M.setup()
  require("lsp.servers").setup()
  require("lsp.ui").setup()

  require("mappings.nvim-lspconfig").setup()
end

return M
