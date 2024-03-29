return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
        on_highlights = function(hl, c)
          -- barbar {{{
          hl.BufferCurrentSign.fg = c.info
          hl.BufferCurrent.bg = c.bg_statusline
          hl.BufferCurrentERROR.bg = c.bg_statusline
          hl.BufferCurrentHINT.bg = c.bg_statusline
          hl.BufferCurrentINFO.bg = c.bg_statusline
          hl.BufferCurrentWARN.bg = c.bg_statusline
          hl.BufferCurrentIndex.bg = c.bg_statusline
          hl.BufferCurrentMod.bg = c.bg_statusline
          hl.BufferCurrentSign.bg = c.bg_statusline
          hl.BufferCurrentTarget.bg = c.bg_statusline

          hl.BufferVisibleSign.fg = c.bg
          hl.BufferVisible.bg = c.bg
          hl.BufferVisibleERROR.bg = c.bg
          hl.BufferVisibleHINT.bg = c.bg
          hl.BufferVisibleINFO.bg = c.bg
          hl.BufferVisibleWARN.bg = c.bg
          hl.BufferVisibleIndex.bg = c.bg
          hl.BufferVisibleMod.bg = c.bg
          hl.BufferVisibleSign.bg = c.bg
          hl.BufferVisibleTarget.bg = c.bg
          -- }}}
        end,
      })

      vim.cmd.colorscheme("tokyonight")
    end,
  },
}
