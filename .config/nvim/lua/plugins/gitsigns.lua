--- lewis6991/gitsigns.nvim
-- @module plugins.gitsigns
local M = {}

function M.setup()
  require("gitsigns").setup({
    keymaps = {},
    current_line_blame = true,
  })

  vim.cmd([[
    augroup gitsigns_colors
      autocmd!
      autocmd ColorScheme * highlight link GitSignsCurrentLineBlame GruvboxBg4
    augroup END
  ]])

  require("mappings.gitsigns").setup()
end

return M
