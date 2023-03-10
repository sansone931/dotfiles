-- {{{ Autocommands
vim.api.nvim_create_autocmd("FileType", {
  pattern = "gitcommit",
  group = vim.api.nvim_create_augroup("git_commit", {}),
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.textwidth = 72
  end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("highlights", {}),
  callback = function()
    vim.cmd([[
      highlight QuickScopePrimary guifg='#458588' gui=underline ctermfg=155 cterm=underline
      highlight QuickScopeSecondary guifg='#cc241d' gui=underline ctermfg=81 cterm=underline
    ]])
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("yank_highlight", {}),
  callback = function()
    vim.highlight.on_yank({ higroup = "Search" })
  end,
})
-- }}}

-- {{{ Options
vim.opt.breakindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.colorcolumn = "+1"
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.cursorline = true
vim.opt.diffopt:append("vertical")
vim.opt.expandtab = true
vim.opt.foldenable = false
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldmethod = "expr"
vim.opt.ignorecase = true
vim.opt.linebreak = true
vim.opt.list = true
vim.opt.number = true
vim.opt.pumheight = 12
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.shortmess:append("I")
vim.opt.showmode = false
vim.opt.showtabline = 2
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.softtabstop = -1
vim.opt.spelloptions:append("camel")
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.textwidth = 80
vim.opt.timeoutlen = 500
vim.opt.wrap = false
-- }}}

-- {{{ Base keymaps
vim.g.mapleader = " "

vim.keymap.set("v", "<", "<gv", { desc = "Shift left" })
vim.keymap.set("v", ">", ">gv", { desc = "Shift right" })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to the left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to the down window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to the up window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to the right window" })

vim.keymap.set("n", "<C-Up>", "<Cmd>resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Down>", "<Cmd>resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Left>", "<Cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<Cmd>vertical resize +2<CR>", { desc = "Increase window width" })

vim.keymap.set("n", "<Leader>n", "<Cmd>nohlsearch<CR>", { desc = "Stop search highlight" })
-- }}}

-- {{{ Plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
-- }}}
