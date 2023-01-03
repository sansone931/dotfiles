--- neovim/nvim-lspconfig
local M = {}

function M.setup()
  require("lsp.servers").setup()
  require("lsp.ui").setup()

  require("keymaps.nvim-lspconfig").setup()
end

return M
