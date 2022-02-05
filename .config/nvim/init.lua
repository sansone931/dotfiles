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

-- Nvim providers
vim.g.python3_host_prog = "/usr/bin/python"
vim.g.node_host_prog = "/usr/lib/node_modules/neovim/bin/cli.js"

-- Needed for nvim-cmp
vim.opt.completeopt = "menu,menuone,noselect"

-- {{{ Base mappings
local map = vim.api.nvim_set_keymap

local function t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

vim.g.mapleader = t("<Space>")

local opts = { silent = true, noremap = true }

-- Better indenting
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Use ctrl + arrows to resize windows
map("n", "<C-Up>", "<Cmd>resize -2<CR>", opts)
map("n", "<C-Down>", "<Cmd>resize +2<CR>", opts)
map("n", "<C-Left>", "<Cmd>vertical resize -2<CR>", opts)
map("n", "<C-Right>", "<Cmd>vertical resize +2<CR>", opts)

-- Disable search highlight
map("n", "<Leader>n", "<Cmd>nohlsearch<CR>", opts)
-- }}}

-- Initialize plugins
require("plugins").setup()
