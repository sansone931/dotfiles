--- unblevable/quick-scope
-- @module plugins.quick-scope
local quick_scope = {}

function quick_scope.setup()
  vim.g.qs_highlight_on_keys = {"f", "F", "t", "T"}

  vim.cmd [[
  augroup qs_colors
    autocmd!
    autocmd VimEnter * highlight QuickScopePrimary guifg='#458588' gui=underline ctermfg=155 cterm=underline
    autocmd VimEnter * highlight QuickScopeSecondary guifg='#cc241d' gui=underline ctermfg=81 cterm=underline
  augroup END
  ]]
end

return quick_scope
