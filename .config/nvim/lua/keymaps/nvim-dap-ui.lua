--- rcarriga/nvim-dap-ui
local M = {}

function M.setup()
  local dapui = require("dapui")

  vim.keymap.set("n", "<Leader>dk", dapui.eval, { desc = "Evaluate" })

  vim.keymap.set("n", "<Leader>dw", function()
    dapui.toggle({ reset = true })
  end, { desc = "Toggle ui" })
end

return M
