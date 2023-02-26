--- neovim/nvim-lspconfig
local M = {}

function M.setup()
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover" })

  vim.keymap.set(
    "n",
    "gK",
    vim.lsp.buf.signature_help,
    { desc = "Show signature help" }
  )

  vim.keymap.set(
    "i",
    "<C-k>",
    vim.lsp.buf.signature_help,
    { desc = "Show signature help" }
  )

  vim.keymap.set(
    "n",
    "[d",
    vim.diagnostic.goto_prev,
    { desc = "Previous diagnostic" }
  )

  vim.keymap.set(
    "n",
    "]d",
    vim.diagnostic.goto_next,
    { desc = "Next diagnostic" }
  )

  vim.keymap.set(
    "n",
    "<Leader>la",
    vim.lsp.buf.code_action,
    { desc = "Show code actions" }
  )

  vim.keymap.set(
    "n",
    "<Leader>ld",
    vim.diagnostic.open_float,
    { desc = "Show line diagnostics" }
  )

  vim.keymap.set("n", "<Leader>lf", function()
    vim.lsp.buf.format({ async = true })
  end, { desc = "Format document" })

  vim.keymap.set("n", "<Leader>lr", vim.lsp.buf.rename, { desc = "Rename" })
end

return M
