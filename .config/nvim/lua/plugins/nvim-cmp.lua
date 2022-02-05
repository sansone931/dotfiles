--- hrsh7th/nvim-cmp
-- @module plugins.nvim-cmp
local M = {}

function M.setup()
  local kind_icons = {
    Text = " ",
    Method = " ",
    Function = " ",
    Constructor = " ",
    Field = " ",
    Variable = " ",
    Class = " ",
    Interface = " ",
    Module = " ",
    Property = " ",
    Unit = " ",
    Value = " ",
    Enum = " ",
    Keyword = " ",
    Snippet = " ",
    Color = " ",
    File = " ",
    Reference = " ",
    Folder = " ",
    EnumMember = " ",
    Constant = " ",
    Struct = " ",
    Event = " ",
    Operator = " ",
    TypeParameter = " ",
  }

  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0
      and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]
          :sub(col, col)
          :match("%s")
        == nil
  end

  local luasnip = require("luasnip")
  local cmp = require("cmp")

  cmp.setup({
    snippet = {
      -- A snippet engine is required
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "buffer" },
      { name = "path" },
    }),
    formatting = {
      format = function(entry, vim_item)
        -- Kind icons
        vim_item.kind = kind_icons[vim_item.kind] .. vim_item.kind
        -- Source
        vim_item.menu = ({
          nvim_lsp = "[LSP]",
          buffer = "[Buffer]",
          path = "[Path]",
        })[entry.source.name]
        return vim_item
      end,
    },
    mapping = {
      ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
      ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      ["<CR>"] = cmp.mapping.confirm({ select = false }),

      ["<C-e>"] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),

      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),

      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
    },
  })

  cmp.setup.cmdline("/", {
    sources = {
      { name = "buffer" },
    },
  })

  cmp.setup.cmdline(":", {
    sources = cmp.config.sources({
      { name = "path" },
    }, {
      { name = "cmdline" },
    }),
  })

  vim.cmd([[
    augroup cmp_colors
      autocmd!
      autocmd ColorScheme * highlight link CmpItemAbbr GruvboxFg0
      autocmd ColorScheme * highlight link CmpItemAbbrDeprecated GruvboxFg0
      autocmd ColorScheme * highlight link CmpItemAbbrMatch GruvboxBlue
      autocmd ColorScheme * highlight link CmpItemAbbrMatchFuzzy GruvboxAqua
      autocmd ColorScheme * highlight link CmpItemKind GruvboxOrange
      autocmd ColorScheme * highlight link CmpItemKindClass GruvboxGreen
      autocmd ColorScheme * highlight link CmpItemKindConstructor GruvboxGreen
      autocmd ColorScheme * highlight link CmpItemKindField GruvboxAqua
      autocmd ColorScheme * highlight link CmpItemKindFile GruvboxOrange
      autocmd ColorScheme * highlight link CmpItemKindFolder GruvboxOrange
      autocmd ColorScheme * highlight link CmpItemKindFunction GruvboxPurple
      autocmd ColorScheme * highlight link CmpItemKindInterface GruvboxGreen
      autocmd ColorScheme * highlight link CmpItemKindKeyword Keyword
      autocmd ColorScheme * highlight link CmpItemKindMethod GruvboxPurple
      autocmd ColorScheme * highlight link CmpItemKindSnippet GruvboxYellow
      autocmd ColorScheme * highlight link CmpItemKindText GruvboxFg0
      autocmd ColorScheme * highlight link CmpItemKindValue GruvboxOrange
      autocmd ColorScheme * highlight link CmpItemKindVariable GruvboxBlue
      autocmd ColorScheme * highlight link CmpItemMenu GruvboxGray
    augroup END
  ]])
end

return M
