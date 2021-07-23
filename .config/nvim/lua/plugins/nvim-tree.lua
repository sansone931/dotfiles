-- kyazdani42/nvim-tree.lua
vim.g.nvim_tree_width = 35
vim.g.nvim_tree_ignore = {".git", "node_modules", ".cache"}
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_special_files = {}

vim.g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "M",
    staged = "A",
    unmerged = "C",
    renamed = "R",
    untracked = "U",
    deleted = "D",
    ignored = ""
  }
}
