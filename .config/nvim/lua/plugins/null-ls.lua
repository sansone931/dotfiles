--- jose-elias-alvarez/null-ls.nvim
-- @module plugins.null-ls
local M = {}

function M.setup()
  local null_ls = require("null-ls")
  local builtins = null_ls.builtins

  local sources = {
    -- {{{ Formatters
    builtins.formatting.eslint_d, -- https://github.com/mantoni/eslint_d.js
    builtins.formatting.prettierd, -- https://github.com/fsouza/prettierd

    -- https://github.com/psf/black
    builtins.formatting.black.with({
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/pull/303
      args = { "--quiet", "--fast", "-" },
    }),

    builtins.formatting.stylua, -- https://github.com/JohnnyMorganz/StyLua
    -- }}}

    -- {{{ Linters
    builtins.diagnostics.eslint_d, -- https://github.com/mantoni/eslint_d.js
    builtins.code_actions.eslint_d, -- https://github.com/mantoni/eslint_d.js

    builtins.diagnostics.flake8, -- https://github.com/PyCGA/flake8
    -- }}}
  }

  null_ls.setup({ sources = sources })
end

return M
