-- Autocommands {{{
vim.cmd([[
  augroup format_options
    autocmd!
    autocmd BufWinEnter * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    autocmd BufRead * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    autocmd BufNewFile * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  augroup END
]])

vim.cmd([[
  augroup git_commit
    autocmd!
    autocmd FileType gitcommit setlocal spell textwidth=72 colorcolumn=72
  augroup END
]])

vim.cmd([[
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#458588' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#cc241d' gui=underline ctermfg=81 cterm=underline
augroup END
]])
-- }}}

-- Options {{{
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 2
vim.opt.colorcolumn = { 80 }
vim.opt.cursorline = true
vim.opt.diffopt:append("vertical")
vim.opt.expandtab = true
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.linebreak = true
vim.opt.list = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.wrap = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.shortmess:append("c")
vim.opt.showtabline = 2
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.timeoutlen = 500
vim.opt.updatetime = 300

-- nvim-treesitter folding
vim.opt.foldmethod = "expr"
vim.opt.foldenable = false
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Needed for nvim-cmp
vim.opt.completeopt = "menu,menuone,noselect"
-- }}}

-- Nvim providers
vim.g.python3_host_prog = "/usr/bin/python"
vim.g.node_host_prog = "/usr/lib/node_modules/neovim/bin/cli.js"

-- {{{ Base keymaps
vim.g.mapleader = " "

vim.keymap.set("v", "<", "<gv", { desc = "Shift left" })
vim.keymap.set("v", ">", ">gv", { desc = "Shift right" })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to the left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to the down window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to the up window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to the right window" })

vim.keymap.set(
  "n",
  "<C-Up>",
  "<Cmd>resize -2<CR>",
  { desc = "Decrease window height" }
)

vim.keymap.set(
  "n",
  "<C-Down>",
  "<Cmd>resize +2<CR>",
  { desc = "Increase window height" }
)

vim.keymap.set(
  "n",
  "<C-Left>",
  "<Cmd>vertical resize -2<CR>",
  { desc = "Decrease window width" }
)

vim.keymap.set(
  "n",
  "<C-Right>",
  "<Cmd>vertical resize +2<CR>",
  { desc = "Increase window width" }
)

vim.keymap.set(
  "n",
  "<Leader>n",
  "<Cmd>nohlsearch<CR>",
  { desc = "Stop search highlight" }
)
-- }}}

-- Initialize plugins
require("plugins").setup()
