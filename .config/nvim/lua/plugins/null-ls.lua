--- jose-elias-alvarez/null-ls.nvim
-- @module plugins.null-ls
local M = {}

function M.setup()
  local builtins = require("null-ls").builtins

  local sources = {
    -- {{{ Formatters
    builtins.formatting.eslint_d, -- https://github.com/mantoni/eslint_d.js
    builtins.formatting.prettierd, -- https://github.com/fsouza/prettierd
    builtins.formatting.black, -- https://github.com/psf/black
    builtins.formatting.stylua, -- https://github.com/JohnnyMorganz/StyLua
    -- }}}

    -- {{{ Linters
    -- eslint_d is handled by nvim-lsp-ts-utils
    builtins.diagnostics.flake8, -- https://github.com/PyCGA/flake8
    -- }}}
  }

  require("null-ls").config({ sources = sources })
  require("lspconfig")["null-ls"].setup({})
end

return M
