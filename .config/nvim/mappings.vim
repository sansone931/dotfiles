" Better indenting
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Use ctrl + arrows to resize windows
nnoremap <silent> <C-Up>    :resize -2<CR>
nnoremap <silent> <C-Down>  :resize +2<CR>
nnoremap <silent> <C-Left>  :vertical resize -2<CR>
nnoremap <silent> <C-Right> :vertical resize +2<CR>

" Navigation between hunks in current buffer
nnoremap <silent> [g :GitGutterPrevHunk<CR>
nnoremap <silent> ]g :GitGutterNextHunk<CR>

" {{{ romgrk/barbar.nvim
nnoremap <silent> <TAB> :BufferNext<CR>
nnoremap <silent> <S-TAB> :BufferPrevious<CR>
nnoremap <silent> <A-,> :BufferMovePrevious<CR>
nnoremap <silent> <A-.> :BufferMoveNext<CR>
nnoremap <silent> <S-q> :BufferClose<CR>
" }}}

" {{{ kyazdani42/nvim-tree.lua
lua <<EOF
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_bindings = {
  ["l"] = tree_cb("edit"),
  ["h"] = tree_cb("close_node"),
}
EOF
" }}}

" {{{ vim-which-key
let g:mapleader = "\<Space>"
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>

let g:which_key_map = {}

" Single key mappings
let g:which_key_map['n'] = [':let @/ = ""'    , 'no highlight'    ]
let g:which_key_map['e'] = [':NvimTreeToggle' , 'toggle explorer' ]
let g:which_key_map['/'] = ['Commentary'      , 'toggle comment'  ]

" CoC
let g:which_key_map['c'] = {
  \ 'name' : '+coc' ,
  \ '.' : [':CocConfig'                        , 'config'             ],
  \ ';' : ['<Plug>(coc-refactor)'              , 'refactor'           ],
  \ 'a' : ['<Plug>(coc-codeaction-line)'       , 'code action (line)' ],
  \ 'A' : ['<Plug>(coc-codeaction)'            , 'code action (file)' ],
  \ 'b' : [':CocNext'                          , 'next action'        ],
  \ 'B' : [':CocPrev'                          , 'prev action'        ],
  \ 'c' : [':CocList commands'                 , 'commands'           ],
  \ 'd' : ['<Plug>(coc-definition)'            , 'definition'         ],
  \ 'D' : ['<Plug>(coc-declaration)'           , 'declaration'        ],
  \ 'e' : [':CocList extensions'               , 'extensions'         ],
  \ 'f' : ['<Plug>(coc-format)'                , 'format'             ],
  \ 'h' : ['<Plug>(coc-float-hide)'            , 'hide'               ],
  \ 'i' : ['<Plug>(coc-implementation)'        , 'implementation'     ],
  \ 'I' : [':CocList diagnostics'              , 'diagnostics'        ],
  \ 'j' : ['<Plug>(coc-float-jump)'            , 'float jump'         ],
  \ 'l' : ['<Plug>(coc-codelens-action)'       , 'code lens'          ],
  \ 'n' : ['<Plug>(coc-diagnostic-next)'       , 'next diagnostic'    ],
  \ 'N' : ['<Plug>(coc-diagnostic-next-error)' , 'next error'         ],
  \ 'o' : [':CocList outline'                  , 'search outline'     ],
  \ 'p' : ['<Plug>(coc-diagnostic-prev)'       , 'prev diagnostic'    ],
  \ 'P' : ['<Plug>(coc-diagnostic-prev-error)' , 'prev error'         ],
  \ 'q' : ['<Plug>(coc-fix-current)'           , 'quickfix'           ],
  \ 'r' : ['<Plug>(coc-references)'            , 'references'         ],
  \ 'R' : ['<Plug>(coc-rename)'                , 'rename'             ],
  \ 's' : [':CocList -I symbols'               , 'references'         ],
  \ 'S' : [':CocList snippets'                 , 'snippets'           ],
  \ 't' : ['<Plug>(coc-type-definition)'       , 'type definition'    ],
  \ 'u' : [':CocListResume'                    , 'resume list'        ],
  \ 'U' : [':CocUpdate'                        , 'update CoC'         ],
  \ 'z' : [':CocDisable'                       , 'disable CoC'        ],
  \ 'Z' : [':CocEnable'                        , 'enable CoC'         ],
  \ }

" Vimspector
nnoremap <leader>de :VimspectorEval<Space>
nnoremap <leader>dw :VimspectorWatch<Space>
nnoremap <leader>dW :VimspectorShowOutput<Space>

let g:which_key_map['d'] = {
  \ 'name' : '+debug' ,
  \ 'b' : ['<Plug>VimspectorToggleBreakpoint'            , 'breakpoint'             ],
  \ 'B' : ['<Plug>VimspectorToggleConditionalBreakpoint' , 'conditional breakpoint' ],
  \ 'c' : ['<Plug>VimspectorRunToCursor'                 , 'run to cursor'          ],
  \ 'd' : ['<Plug>VimspectorContinue'                    , 'continue'               ],
  \ 'f' : ['<Plug>VimspectorAddFunctionBreakpoint'       , 'function breakpoint'    ],
  \ 'o' : ['<Plug>VimspectorStepOver'                    , 'step over'              ],
  \ 'O' : ['<Plug>VimspectorStepOut'                     , 'step out'               ],
  \ 'i' : ['<Plug>VimspectorStepInto'                    , 'step into'              ],
  \ 'p' : ['<Plug>VimspectorPause'                       , 'pause'                  ],
  \ 'r' : ['<Plug>VimspectorRestart'                     , 'restart'                ],
  \ 's' : ['<Plug>VimspectorStop'                        , 'stop'                   ],
  \ 'q' : [':VimspectorReset'                            , 'close debugger'         ],
  \ 'e' : 'send console command'  ,
  \ 'w' : 'watch expression'      ,
  \ 'W' : 'select output channel' ,
  \ }

" Telescope
let g:which_key_map['f'] = {
  \ 'name': '+telescope',
  \ '/': [':Telescope search_history'  , 'history'        ],
  \ 'b': [':Telescope buffers'         , 'buffers'        ],
  \ 'c': [':Telescope treesitter'      , 'treesitter'     ],
  \ 'f': [':Telescope find_files'      , 'files'          ],
  \ 'h': [':Telescope oldfiles'        , 'file history'   ],
  \ 't': [':Telescope live_grep'       , 'text'           ],
  \ }

" Git
let g:which_key_map['g'] = {
  \ 'name': '+git',
  \ 'd': [':Gdiffsplit'                  , 'diff split'   ],
  \ 'b': [':G blame'                     , 'blame'        ],
  \ 'B': [':GBrowse'                     , 'browse'       ],
  \ 'g': [':G'                           , 'status'       ],
  \ 's': ['<Plug>(GitGutterStageHunk)'   , 'stage hunk'   ],
  \ 'u': ['<Plug>(GitGutterUndoHunk)'    , 'undo hunk'    ],
  \ 'p': ['<Plug>(GitGutterPreviewHunk)' , 'preview hunk' ],
  \ }

call which_key#register('<Space>', "g:which_key_map")
" }}}

" {{{ Mappings for CoC
" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[c` and `]c` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Formatting selected code.
xmap <leader>cf <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
xmap <leader>ca <Plug>(coc-codeaction-selected)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)
" }}}

"{{{ Mappings for vim-commentary
vnoremap <leader>/ :Commentary<CR>
" }}}
