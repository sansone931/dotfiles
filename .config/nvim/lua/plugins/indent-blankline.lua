--- lukas-reineke/indent-blankline.nvim
local M = {}

function M.setup()
  require("indent_blankline").setup({
    show_current_context = true,
    use_treesitter_scope = true,
    show_trailing_blankline_indent = false,
  })

  require("keymaps.indent-blankline").setup()
end

return M
