vim.cmd([[
  augroup format_options
    autocmd!
    autocmd BufWinEnter * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    autocmd BufRead * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    autocmd BufNewFile * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
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

-- Needed for nvim-compe
vim.opt.completeopt = "menuone,noselect"
