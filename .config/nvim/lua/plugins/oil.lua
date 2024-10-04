return {
  {
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = { "echasnovski/mini.icons" },
    keys = {
      { "-", "<Cmd>Oil<CR>", desc = "Open parent directory" },
    },
    config = function()
      function _G.get_oil_winbar()
        local dir = require("oil").get_current_dir()
        if dir then
          return vim.fn.fnamemodify(dir, ":~:.")
        else
          return vim.api.nvim_buf_get_name(0)
        end
      end

      require("oil").setup({
        keymaps = {
          ["<C-s>"] = false,
          ["<C-h>"] = false,
          ["<C-t>"] = false,
          ["<C-l>"] = false,
        },
        win_options = {
          winbar = "%{v:lua.get_oil_winbar()}",
        },
      })
    end,
  },
}
