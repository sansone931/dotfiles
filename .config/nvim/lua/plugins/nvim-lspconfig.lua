--- neovim/nvim-lspconfig
local M = {}

function M.setup()
  -- Automatically install servers with mason.nvim
  require("mason-lspconfig").setup({
    automatic_installation = true,
  })

  require("lsp.servers").setup()
  require("lsp.ui").setup()

  require("keymaps.nvim-lspconfig").setup()
end

return M
