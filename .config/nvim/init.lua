-- {{{ Autocommands
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
vim.opt.colorcolumn = { "+1" }
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
vim.opt.shiftwidth = 2
vim.opt.shortmess:append("I")
vim.opt.showmode = false
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

-- {{{ Keymaps
vim.g.mapleader = " "

vim.keymap.set("x", "<", "<gv", { desc = "Shift left" })
vim.keymap.set("x", ">", ">gv", { desc = "Shift right" })

vim.keymap.set("n", "<C-H>", "<C-W>h", { desc = "Go to the left window" })
vim.keymap.set("n", "<C-J>", "<C-W>j", { desc = "Go to the down window" })
vim.keymap.set("n", "<C-K>", "<C-W>k", { desc = "Go to the up window" })
vim.keymap.set("n", "<C-L>", "<C-W>l", { desc = "Go to the right window" })

vim.keymap.set("n", "<C-Up>", "<Cmd>resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Down>", "<Cmd>resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Left>", "<Cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<Cmd>vertical resize +2<CR>", { desc = "Increase window width" })

vim.keymap.set("n", "<A-u>", "<Cmd>nohlsearch<CR>", { desc = "Stop search highlight" })
vim.keymap.set("n", "<Leader>n", "<Cmd>nohlsearch<CR>", { desc = "Stop search highlight" })

vim.keymap.set("c", "<C-A>", "<Home>", { desc = "Start of line" })
vim.keymap.set("c", "<C-D>", "<Del>", { desc = "Delete character under cursor" })
vim.keymap.set("c", "<A-h>", "<Left>", { desc = "Back one character" })
vim.keymap.set("c", "<A-j>", "<Down>", { desc = "Recall newer command-line" })
vim.keymap.set("c", "<A-k>", "<Up>", { desc = "Recall older command-line" })
vim.keymap.set("c", "<A-l>", "<Right>", { desc = "Forward one character" })
vim.keymap.set("c", "<A-b>", "<C-Left>", { desc = "Back one word" })
vim.keymap.set("c", "<A-f>", "<C-Right>", { desc = "Forward one word" })
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

vim.keymap.set("n", "<Leader>L", "<Cmd>Lazy<CR>", { desc = "Show lazy.nvim window" })
-- }}}
