return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "jayp0521/mason-nvim-dap.nvim",
        dependencies = { "williamboman/mason.nvim", config = true },
      },
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
    },
    keys = function()
      local dap = require("dap")

      return {
        { "<Leader>db", dap.toggle_breakpoint, desc = "Toggle breakpoint" },
        {
          "<Leader>dB",
          function()
            dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
          end,
          desc = "Set conditional breakpoint",
        },
        { "<Leader>dc", dap.run_to_cursor, desc = "Run to cursor" },
        { "<Leader>dd", dap.continue, desc = "Continue" },
        { "<Leader>dD", dap.run_last, desc = "Run last" },
        { "<Leader>di", dap.step_into, desc = "Step into" },
        { "<Leader>do", dap.step_over, desc = "Step over" },
        { "<Leader>dO", dap.step_out, desc = "Step out" },
        { "<Leader>dp", dap.step_back, desc = "Step back" },
        { "<Leader>dP", dap.pause, desc = "Pause" },
        { "<Leader>dq", dap.terminate, desc = "Terminate" },
      }
    end,
    config = function()
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
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    lazy = true,
    keys = function()
      local dapui = require("dapui")

      return {

        { "<Leader>dk", dapui.eval, desc = "Evaluate" },
        {
          "<Leader>dw",
          function()
            dapui.toggle({ reset = true })
          end,
          desc = "Toggle ui",
        },
      }
    end,
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open({ reset = true })
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
        dap.repl.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
        dap.repl.close()
      end
    end,
  },

  {
    "theHamsta/nvim-dap-virtual-text",
    lazy = true,
    keys = {
      { "<Leader>dv", "<Cmd>DapVirtualTextToggle<CR>", desc = "Toggle virtual text" },
      { "<Leader>dV", "<Cmd>DapVirtualTextForceRefresh<CR>", desc = "Refresh virtual text" },
    },
    config = true,
  },
}