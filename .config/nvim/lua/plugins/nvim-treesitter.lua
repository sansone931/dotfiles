--- nvim-treesitter/nvim-treesitter
local M = {}

function M.setup()
  require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    highlight = { enable = true },
    incremental_selection = { enable = true },
    indent = { enable = true },
    context_commentstring = { enable = true },
  })
end

return M
