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
        default_file_explorer = false,
        keymaps = {
          ["<C-s>"] = false,
          ["<C-h>"] = false,
          ["<C-t>"] = false,
          ["<C-l>"] = false,
          ["`"] = false,
          ["~"] = "actions.cd",
          ["g<C-L>"] = "actions.refresh",
          ["gy"] = { "actions.yank_entry", opts = { modify = ":~:." }, desc = "Yank relative path" },
          ["gY"] = { "actions.yank_entry", desc = "Yank absolute path" },
        },
        win_options = {
          winbar = "%{v:lua.get_oil_winbar()}",
        },
      })
    end,
  },
}
