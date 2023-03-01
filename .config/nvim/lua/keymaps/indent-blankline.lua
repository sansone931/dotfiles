--- lukas-reineke/indent-blankline.nvim
local M = {}

function M.setup()
  vim.keymap.set(
    "n",
    "<Leader>i",
    "<Cmd>IndentBlanklineToggle!<CR>",
    { desc = "Toggle indent guides" }
  )

  local fold_keymaps = {
    "zo",
    "zO",
    "zc",
    "zC",
    "za",
    "zA",
    "zv",
    "zx",
    "zX",
    "zm",
    "zM",
    "zr",
    "zR",
  }

  for _, keymap in pairs(fold_keymaps) do
    vim.keymap.set(
      { "n", "x" },
      keymap,
      keymap .. "<Cmd>IndentBlanklineRefresh<CR>"
    )
  end
end

return M
