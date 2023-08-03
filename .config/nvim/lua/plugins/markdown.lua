return {
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = "markdown",
    init = function()
      vim.g.mkdp_preview_options = {
        disable_sync_scroll = 1,
      }
    end,
  },
}
