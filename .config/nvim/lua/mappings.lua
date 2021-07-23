-- Better indenting
vim.api.nvim_set_keymap("v", "<", "<gv", {noremap = true})
vim.api.nvim_set_keymap("v", ">", ">gv", {noremap = true})

-- Better window navigation
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", {noremap = true})

-- Use ctrl + arrows to resize windows
vim.api.nvim_set_keymap("n", "<C-Up>", ":resize -2<CR>",
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap("n", "<C-Down>", ":resize +2<CR>",
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap("n", "<C-Left>", ":vertical resize -2<CR>",
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap("n", "<C-Right>", ":vertical resize +2<CR>",
  {noremap = true, silent = true}
)

-- Navigation between hunks in current buffer
vim.api.nvim_set_keymap("n", "[g", ":GitGutterPrevHunk<CR>",
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap("n", "]g", ":GitGutterNextHunk<CR>",
  {noremap = true, silent = true}
)

-- {{{ romgrk/barbar.nvim
vim.api.nvim_set_keymap("n", "<Tab>", ":BufferNext<CR>",
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap("n", "<S-Tab>", ":BufferPrevious<CR>",
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap("n", "<A-,>", ":BufferMovePrevious<CR>",
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap("n", "<A-.>", ":BufferMoveNext<CR>",
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap("n", "<S-q>", ":BufferClose<CR>",
  {noremap = true, silent = true}
)
-- }}}

-- {{{ kyazdani42/nvim-tree.lua
local tree_cb = require("nvim-tree.config").nvim_tree_callback

vim.g.nvim_tree_bindings = {
  {key = "l", cb = tree_cb("edit")},
  {key = "h", cb = tree_cb("close_node")},
}
-- }}}

-- {{{ tpope/vim-commentary
vim.api.nvim_set_keymap("v", "/", ":Commentary<CR>", {noremap = true})
-- }}}

-- {{{ liuchengxu/vim-which-key
vim.g.mapleader = vim.api.nvim_replace_termcodes("<Space>", true, true, true)

vim.api.nvim_set_keymap("n", "<Leader>", ":<C-u>WhichKey '<Space>'<CR>",
  {noremap = true, silent = true}
)

local which_key_map = {}

-- Single key mappings
which_key_map["n"] = {":let @/ = ''"   , "no highlight"   }
which_key_map["e"] = {":NvimTreeToggle", "toggle explorer"}
which_key_map["/"] = {"Commentary"     , "toggle comment" }

-- neoclide/coc.nvim
which_key_map["c"] = {
  name = "+coc",
  ["."] = {":CocConfig"                       , "config"            },
  [";"] = {"<Plug>(coc-refactor)"             , "refactor"          },
  a     = {"<Plug>(coc-codeaction-line)"      , "code action (line)"},
  A     = {"<Plug>(coc-codeaction)"           , "code action (file)"},
  b     = {":CocNext"                         , "next action"       },
  B     = {":CocPrev"                         , "prev action"       },
  c     = {":CocList commands"                , "commands"          },
  d     = {"<Plug>(coc-definition)"           , "definition"        },
  D     = {"<Plug>(coc-declaration)"          , "declaration"       },
  e     = {":CocList extensions"              , "extensions"        },
  f     = {"<Plug>(coc-format)"               , "format"            },
  h     = {"<Plug>(coc-float-hide)"           , "hide"              },
  i     = {"<Plug>(coc-implementation)"       , "implementation"    },
  I     = {":CocList diagnostics"             , "diagnostics"       },
  j     = {"<Plug>(coc-float-jump)"           , "float jump"        },
  l     = {"<Plug>(coc-codelens-action)"      , "code lens"         },
  n     = {"<Plug>(coc-diagnostic-next)"      , "next diagnostic"   },
  N     = {"<Plug>(coc-diagnostic-next-error)", "next error"        },
  o     = {":CocList outline"                 , "search outline"    },
  p     = {"<Plug>(coc-diagnostic-prev)"      , "prev diagnostic"   },
  P     = {"<Plug>(coc-diagnostic-prev-error)", "prev error"        },
  q     = {"<Plug>(coc-fix-current)"          , "quickfix"          },
  r     = {"<Plug>(coc-references)"           , "references"        },
  R     = {"<Plug>(coc-rename)"               , "rename"            },
  s     = {":CocList -I symbols"              , "references"        },
  S     = {":CocList snippets"                , "snippets"          },
  t     = {"<Plug>(coc-type-definition)"      , "type definition"   },
  u     = {":CocListResume"                   , "resume list"       },
  U     = {":CocUpdate"                       , "update CoC"        },
  z     = {":CocDisable"                      , "disable CoC"       },
  Z     = {":CocEnable"                       , "enable CoC"        },
}

-- puremourning/vimspector
vim.api.nvim_set_keymap("n", "<Leader>de", ":VimspectorEval<Space>",
  {noremap = true}
)
vim.api.nvim_set_keymap("n", "<Leader>dw", ":VimspectorWatch<Space>",
  {noremap = true}
)
vim.api.nvim_set_keymap("n", "<Leader>dW", ":VimspectorShowOutput<Space>",
  {noremap = true}
)

which_key_map["d"] = {
  name = "+debug",
  b = {"<Plug>VimspectorToggleBreakpoint"           , "breakpoint"            },
  B = {"<Plug>VimspectorToggleConditionalBreakpoint", "conditional breakpoint"},
  c = {"<Plug>VimspectorRunToCursor"                , "run to cursor"         },
  d = {"<Plug>VimspectorContinue"                   , "continue"              },
  f = {"<Plug>VimspectorAddFunctionBreakpoint"      , "function breakpoint"   },
  o = {"<Plug>VimspectorStepOver"                   , "step over"             },
  O = {"<Plug>VimspectorStepOut"                    , "step out"              },
  i = {"<Plug>VimspectorStepInto"                   , "step into"             },
  p = {"<Plug>VimspectorPause"                      , "pause"                 },
  r = {"<Plug>VimspectorRestart"                    , "restart"               },
  s = {"<Plug>VimspectorStop"                       , "stop"                  },
  q = {":VimspectorReset"                           , "close debugger"        },
  e = "send console command" ,
  w = "watch expression"     ,
  W = "select output channel",
}

-- nvim-telescope/telescope.nvim
which_key_map["f"] = {
  name = "+telescope",
  ["/"] = {":Telescope search_history", "history"     },
  b     = {":Telescope buffers"       , "buffers"     },
  c     = {":Telescope treesitter"    , "treesitter"  },
  f     = {":Telescope find_files"    , "files"       },
  h     = {":Telescope oldfiles"      , "file history"},
  s     = {":Telescope treesitter"    , "symbols"     },
  t     = {":Telescope live_grep"     , "text"        },
}

-- tpope/vim-fugitive
-- airblade/vim-gitgutter
which_key_map["g"] = {
  name = "+git",
  d = {":Gdiffsplit"                 , "diff split"  },
  b = {":G blame"                    , "blame"       },
  g = {":G"                          , "status"      },
  s = {"<Plug>(GitGutterStageHunk)"  , "stage hunk"  },
  u = {"<Plug>(GitGutterUndoHunk)"   , "undo hunk"   },
  p = {"<Plug>(GitGutterPreviewHunk)", "preview hunk"},
}

vim.fn["which_key#register"]("<Space>", which_key_map)
-- }}}

-- {{{ neoclide/coc.nvim
-- Use tab for trigger completion with characters ahead and navigate.
vim.api.nvim_set_keymap("i", "<Tab>",
  [[pumvisible() ? "\<C-n>" : Check_back_space() ? "\<Tab>" : coc#refresh()]],
  {noremap = true, silent = true, expr = true}
)
vim.api.nvim_set_keymap("i", "<S-Tab>",
  [[pumvisible() ? "\<C-p>" : "\<C-h>"]],
  {noremap = true, silent = true, expr = true}
)

vim.cmd [[
  function! Check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction
]]

-- Use <c-space> to trigger completion.
vim.api.nvim_set_keymap("i", "<c-space>", "coc#refresh()",
  {noremap = true, silent = true, expr = true}
)

-- Make <CR> auto-select the first completion item and notify coc.nvim to
-- format on enter, <CR> could be remapped by other vim plugin
vim.api.nvim_set_keymap("i", "<CR>",
  [[pumvisible() ? coc#_select_confirm() : ]] ..
  [["\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]],
  {noremap = true, silent = true, expr = true}
)

-- Use `[c` and `]c` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location
-- list.
vim.api.nvim_set_keymap("n", "[c", "<Plug>(coc-diagnostic-prev)",
  {silent = true}
)
vim.api.nvim_set_keymap("n", "]c", "<Plug>(coc-diagnostic-next)",
  {silent = true}
)

-- GoTo code navigation.
vim.api.nvim_set_keymap("n", "gd", "<Plug>(coc-definition)",
  {silent = true}
)
vim.api.nvim_set_keymap("n", "gy", "<Plug>(coc-type-definition)",
  {silent = true}
)
vim.api.nvim_set_keymap("n", "gi", "<Plug>(coc-implementation)",
  {silent = true}
)
vim.api.nvim_set_keymap("n", "gr", "<Plug>(coc-references)",
  {silent = true}
)

-- Use K to show documentation in preview window.
vim.api.nvim_set_keymap("n", "K", ":call Show_documentation()<CR>",
  {noremap = true, silent = true}
)

vim.cmd [[
  function! Show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
      call CocActionAsync('doHover')
    else
      execute '!' . &keywordprg . " " . expand('<cword>')
    endif
  endfunction
]]

-- Formatting selected code.
vim.api.nvim_set_keymap("x", "<Leader>cf", "<Plug>(coc-format-selected)",
  {}
)

-- Applying codeAction to the selected region.
vim.api.nvim_set_keymap("x", "<Leader>ca", "<Plug>(coc-codeaction-selected)",
  {}
)

-- Remap <C-f> and <C-b> for scroll float windows/popups.
vim.api.nvim_set_keymap("n", "<C-f>",
  [[coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"]],
  {noremap = true, silent = true, nowait = true, expr = true}
)
vim.api.nvim_set_keymap("n", "<C-b>",
  [[coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"]],
  {noremap = true, silent = true, nowait = true, expr = true}
)

vim.api.nvim_set_keymap("i", "<C-f>",
  [[coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<CR>" : "\<Right>"]],
  {noremap = true, silent = true, nowait = true, expr = true}
)
vim.api.nvim_set_keymap("i", "<C-b>",
  [[coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<CR>" : "\<Left>"]],
  {noremap = true, silent = true, nowait = true, expr = true}
)

vim.api.nvim_set_keymap("v", "<C-f>",
  [[coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"]],
  {noremap = true, silent = true, nowait = true, expr = true}
)
vim.api.nvim_set_keymap("v", "<C-b>",
  [[coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"]],
  {noremap = true, silent = true, nowait = true, expr = true}
)
-- }}}
