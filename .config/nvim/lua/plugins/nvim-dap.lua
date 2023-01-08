--- mfussenegger/nvim-dap
local M = {}

function M.setup()
  local dap = require("dap")

  dap.defaults.fallback.external_terminal = {
    command = "/usr/bin/alacritty",
    args = { "-e" },
  }

  -- {{{ Adapters configuration
  dap.adapters.node = {
    type = "executable",
    command = "node-debug2-adapter",
  }

  -- Needed for automatic installation with mason-nvim-dap
  dap.adapters.node2 = dap.adapters.node

  dap.adapters.python = {
    type = "executable",
    command = "debugpy",
  }
  -- }}}

  -- Load configuration from .vscode/launch.json
  require("dap.ext.vscode").load_launchjs(nil, {
    node = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
  })

  -- Automatically install adapters with mason.nvim
  require("mason-nvim-dap").setup({
    automatic_installation = true,
  })

  require("keymaps.nvim-dap").setup()
end

return M
