-- unblevable/quick-scope
vim.g.qs_highlight_on_keys = {"f", "F", "t", "T"}

vim.cmd [[
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#458588' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#cc241d' gui=underline ctermfg=81 cterm=underline
augroup END
]]
