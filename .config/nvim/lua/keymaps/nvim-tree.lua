--- kyazdani42/nvim-tree.lua
local M = {}

function M.setup()
  vim.keymap.set(
    "n",
    "<Leader>e",
    "<Cmd>NvimTreeToggle<CR>",
    { desc = "Toggle explorer" }
  )
end

return M
