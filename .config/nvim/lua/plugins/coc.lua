--- neoclide/coc.nvim
-- @module plugins.coc
local coc = {}

function coc.setup()
  vim.g.coc_global_extensions = {
    "coc-tsserver",
    "coc-eslint",
    "coc-prettier",
    "coc-styled-components",
    "coc-pyright",
    "coc-graphql",
    "coc-json",
    "coc-html",
    "coc-yaml",
    "coc-sh",
    "coc-vimlsp",
    "coc-lua",
  }
end

return coc
