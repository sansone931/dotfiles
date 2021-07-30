--- nvim-treesitter/nvim-treesitter
-- @module plugins.nvim-treesitter
local nvim_treesitter = {}

function nvim_treesitter.setup()
  require("nvim-treesitter.configs").setup {
    ensure_installed = "all",
    highlight = { enable = true },
    incremental_selection = { enable = true },
    indent = { enable = true },
    context_commentstring = { enable = true },
  }
end

return nvim_treesitter
