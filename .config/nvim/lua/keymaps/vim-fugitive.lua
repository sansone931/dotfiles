--- tpope/vim-fugitive
local M = {}

function M.setup()
  vim.keymap.set(
    "n",
    "<Leader>gd",
    "<Cmd>Gdiffsplit!<CR>",
    { desc = "Diff split" }
  )

  vim.keymap.set("n", "<Leader>gB", "<Cmd>Git blame<CR>", { desc = "Blame" })
  vim.keymap.set("n", "<Leader>gg", "<Cmd>Git<CR>", { desc = "Status" })

  vim.keymap.set(
    "n",
    "<Leader>gh",
    "<Cmd>0Gclog<CR>",
    { desc = "File commit history" }
  )

  vim.keymap.set("n", "<Leader>gl", "<Cmd>Git log<CR>", { desc = "Log" })

  vim.keymap.set(
    "n",
    "<Leader>gx",
    "<Cmd>GBrowse<CR>",
    { desc = "Open in browser" }
  )
end

return M
