--- nvim-telescope/telescope.nvim
local M = {}

function M.setup()
  local wk = require("which-key")

  local function show_grep_string_prompt()
    local grep_string = require("telescope.builtin").grep_string
    grep_string({ search = vim.fn.input("Grep For > ") })
  end

  wk.register({
    f = {
      name = "telescope",
      ["/"] = { "<Cmd>Telescope current_buffer_fuzzy_find<CR>", "search current buffer" },
      ["?"] = { "<Cmd>Telescope builtin<CR>"                  , "builtin pickers"       },
      f     = { "<Cmd>Telescope find_files<CR>"               , "files"                 },
      g     = { "<Cmd>Telescope git_status<CR>"               , "git status"            },
      h     = { "<Cmd>Telescope oldfiles<CR>"                 , "file history"          },
      d     = { "<Cmd>Telescope diagnostics bufnr=0<CR>"      , "document diagnostics"  },
      D     = { "<Cmd>Telescope diagnostics<CR>"              , "workspace diagnostics" },
      r     = { "<Cmd>Telescope resume<CR>"                   , "resume"                },
      t     = { "<Cmd>Telescope live_grep<CR>"                , "text (live_grep)"      },
      T     = { show_grep_string_prompt                       , "text (grep_string)"    },
      w     = { "<Cmd>Telescope grep_string<CR>"              , "word under cursor"     },
    },
  }, { prefix = "<Leader>" })

  wk.register({
    d = { "<Cmd>Telescope lsp_definitions<CR>"     , "definition"      },
    i = { "<Cmd>Telescope lsp_implementations<CR>" , "implementation"  },
    r = { "<Cmd>Telescope lsp_references<CR>"      , "references"      },
    y = { "<Cmd>Telescope lsp_type_definitions<CR>", "type definition" },
  }, { prefix = "g" })
end

return M
