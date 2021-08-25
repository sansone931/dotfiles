--- mfussenegger/nvim-dap
-- @module mappings.nvim-dap
local M = {}

function M.setup()
  local wk = require("which-key")

  local function close_debugger()
    local dap = require("dap")
    dap.disconnect()
    dap.close()
  end

  local function set_conditional_breakpoint()
    require("dap").set_breakpoint(
      vim.fn.input('Breakpoint condition: ')
    )
  end

  wk.register({
    d = {
      name = "debug",
      b = { '<Cmd>lua require("dap").toggle_breakpoint()<CR>' , "breakpoint"             },
      B = { set_conditional_breakpoint                        , "conditional breakpoint" },
      c = { '<Cmd>lua require("dap").run_to_cursor()<CR>'     , "run to cursor"          },
      d = { '<Cmd>lua require("dap").continue()<CR>'          , "continue"               },
      h = { '<Cmd>lua require("dap.ui.variables").hover()<CR>', "show hover"             },
      i = { '<Cmd>lua require("dap").step_into()<CR>'         , "step into"              },
      l = { '<Cmd>lua require("dap").run_last()<CR>'          , "run last"               },
      o = { '<Cmd>lua require("dap").step_over()<CR>'         , "step over"              },
      O = { '<Cmd>lua require("dap").step_out()<CR>'          , "step out"               },
      q = { close_debugger                                    , "stop"                   },
      w = { '<Cmd>lua require("dapui").toggle()<CR>'          , "toggle debugger ui"     },
    },
  }, { prefix = "<Leader>" })
end

return M
