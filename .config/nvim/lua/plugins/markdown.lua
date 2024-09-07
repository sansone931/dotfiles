return {
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = "markdown",
    keys = {
      { "<Leader>mp", "<Cmd>MarkdownPreviewToggle<CR>", desc = "Toggle markdown preview" },
    },
    init = function()
      vim.g.mkdp_preview_options = {
        disable_sync_scroll = 1,
      }
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = "markdown",
    keys = {
      { "<Leader>mr", "<Cmd>RenderMarkdown toggle<CR>", desc = "Toggle markdown render" },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" },
  },
}
