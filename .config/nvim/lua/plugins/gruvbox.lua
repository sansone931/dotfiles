--- morhetz/gruvbox
-- @module plugins.gruvbox
local gruvbox = {}

function gruvbox.setup()
  vim.g.gruvbox_italic = 1
  vim.g.gruvbox_invert_selection = 0

  vim.cmd [[
    colorscheme gruvbox
    augroup gruvbox
      autocmd!
      autocmd VimEnter * highlight Normal guibg=NONE ctermbg=NONE
    augroup END
  ]]
end

return gruvbox
