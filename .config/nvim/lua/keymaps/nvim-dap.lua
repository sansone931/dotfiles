--- mfussenegger/nvim-dap
local M = {}

function M.setup()
  local dap = require("dap")

  vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, {
    desc = "Toggle breakpoint",
  })

  vim.keymap.set("n", "<Leader>dB", function()
    dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
  end, { desc = "Set conditional breakpoint" })

  vim.keymap.set(
    "n",
    "<Leader>dc",
    dap.run_to_cursor,
    { desc = "Run to cursor" }
  )

  vim.keymap.set("n", "<Leader>dd", dap.continue, { desc = "Continue" })
  vim.keymap.set("n", "<Leader>dD", dap.run_last, { desc = "Run last" })
  vim.keymap.set("n", "<Leader>di", dap.step_into, { desc = "Step into" })
  vim.keymap.set("n", "<Leader>do", dap.step_over, { desc = "Step over" })
  vim.keymap.set("n", "<Leader>dO", dap.step_out, { desc = "Step out" })
  vim.keymap.set("n", "<Leader>dp", dap.step_back, { desc = "Step back" })
  vim.keymap.set("n", "<Leader>dP", dap.pause, { desc = "Pause" })
  vim.keymap.set("n", "<Leader>dq", dap.terminate, { desc = "Terminate" })
end

return M
