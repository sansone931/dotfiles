--- @module lsp.servers.tsserver
local M = {}

function M.setup()
  require("lspconfig").tsserver.setup({
    on_attach = function(client)
      -- formatting is handled by null-ls
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false

      -- format on save
      vim.cmd([[
      augroup tsserver
        autocmd!
        autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
      augroup END
      ]])

      -- {{{ jose-elias-alvarez/nvim-lsp-ts-utils
      local ts_utils = require("nvim-lsp-ts-utils")

      ts_utils.setup({
        debug = false,
        disable_commands = false,
        enable_import_on_completion = false,

        -- import all
        import_all_timeout = 5000, -- ms
        import_all_priorities = {
          buffers = 4, -- loaded buffer names
          buffer_content = 3, -- loaded buffer content
          local_files = 2, -- git files or files with relative path markers
          same_file = 1, -- add to existing import statement
        },
        import_all_scan_buffers = 100,
        import_all_select_source = false,

        -- eslint
        eslint_enable_code_actions = true,
        eslint_enable_disable_comments = false,
        eslint_bin = "eslint_d", -- https://github.com/mantoni/eslint_d.js
        eslint_config_fallback = nil,
        eslint_enable_diagnostics = true,
        eslint_show_rule_id = true,

        -- formatting
        enable_formatting = false, -- formatting is handled by null-ls directly
        formatter = "prettierd", -- https://github.com/fsouza/prettierd
        formatter_config_fallback = nil,

        -- update imports on file move
        update_imports_on_move = false,
        require_confirmation_on_move = false,
        watch_dir = nil,
      })

      -- required to fix code action ranges
      ts_utils.setup_client(client)
      -- }}}
    end,
  })
end

return M
