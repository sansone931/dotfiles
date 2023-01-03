--- neovim/nvim-lspconfig
local M = {}

function M.setup()
  local wk = require("which-key")
  local map = vim.keymap.set
  local opts = { silent = true }

  map("n", "<S-k>", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  map("n", "[d", '<Cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  map("n", "]d", '<Cmd>lua vim.diagnostic.goto_next()<CR>', opts)

  wk.register({
    l = {
      name = "lsp",
      a = { "<Cmd>lua vim.lsp.buf.code_action()<CR>"           , "code action"      },
      d = { '<Cmd>lua vim.diagnostic.open_float()<CR>'         , "line diagnostics" },
      f = { "<Cmd>lua vim.lsp.buf.format({ async = true })<CR>", "format"           },
      r = { "<Cmd>lua vim.lsp.buf.rename()<CR>"                , "rename"           },
      q = { "<Cmd>lua vim.diagnostic.setloclist()<CR>"         , "quickfix"         },
    },
  }, { prefix = "<Leader>" })

  wk.register({
    d = { "<Cmd>lua vim.lsp.buf.definition()<CR>"     , "definition"      },
    D = { "<Cmd>lua vim.lsp.buf.declaration()<CR>"    , "declaration"     },
    i = { "<Cmd>lua vim.lsp.buf.implementation()<CR>" , "implementation"  },
    r = { "<Cmd>lua vim.lsp.buf.references()<CR>"     , "references"      },
    y = { "<Cmd>lua vim.lsp.buf.type_definition()<CR>", "type definition" },
  }, { prefix = "g" })
end

return M
