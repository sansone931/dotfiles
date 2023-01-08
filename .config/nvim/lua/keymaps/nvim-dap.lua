--- mfussenegger/nvim-dap
local M = {}

function M.setup()
  local wk = require("which-key")

  local function set_conditional_breakpoint()
    require("dap").set_breakpoint(
      vim.fn.input('Breakpoint condition: ')
    )
  end

  wk.register({
    d = {
      name = "debug",
      b = { '<Cmd>lua require("dap").toggle_breakpoint()<CR>'       , "breakpoint"             },
      B = { set_conditional_breakpoint                              , "conditional breakpoint" },
      c = { '<Cmd>lua require("dap").run_to_cursor()<CR>'           , "run to cursor"          },
      d = { '<Cmd>lua require("dap").continue()<CR>'                , "continue"               },
      D = { '<Cmd>lua require("dap").run_last()<CR>'                , "run last"               },
      i = { '<Cmd>lua require("dap").step_into()<CR>'               , "step into"              },
      k = { '<Cmd>lua require("dapui").eval()<CR>'                  , "evaluate"               },
      o = { '<Cmd>lua require("dap").step_over()<CR>'               , "step over"              },
      O = { '<Cmd>lua require("dap").step_out()<CR>'                , "step out"               },
      p = { '<Cmd>lua require("dap").step_back()<CR>'               , "step back"              },
      P = { '<Cmd>lua require("dap").pause()<CR>'                   , "pause"                  },
      q = { '<Cmd>lua require("dap").terminate()<CR>'               , "terminate"              },
      v = { '<Cmd>DapVirtualTextToggle<CR>'                         , "toggle virtual text"    },
      V = { '<Cmd>DapVirtualTextForceRefresh<CR>'                   , "virtual text refresh"   },
      w = { '<Cmd>lua require("dapui").toggle({ reset = true })<CR>', "toggle ui"              },
    },
  }, { prefix = "<Leader>" })
end

return M
