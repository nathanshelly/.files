" support comments in json
" ref - https://github.com/neoclide/coc.nvim/wiki/Using-configuration-file
autocmd FileType json syntax match Comment +\/\/.\+$+

" << completion >>
" ref - https://github.com/neoclide/coc.nvim/wiki/Completion-with-sources#improve-completion-experience

" confirm completion with <c-space>
" `<c-g>u` means break undo chain at current position
inoremap <expr> <c-space> pumvisible() ? "\<c-y>" : "\<c-g>u\<c-space>"

" move up and down preview window
inoremap <expr> <c-k> pumvisible() ? "\<C-n>" : "\<c-k>"
inoremap <expr> <c-l> pumvisible() ? "\<C-p>" : "\<c-l>"

" NOTE: namespace less important command with `<leader>c`
" NOTE: `<Plug>` mappings used to route command to plugins
" ref - https://www.reddit.com/r/vim/comments/78izt4/please_help_understand_how_to_use_plug_mapping/

" show diagnostic information
" TODO: figure out what's wrong with below line
" nmap <leader>cd <Plug>(coc-diagnostic-info)
" move between diagnostics
nmap <leader>cn <Plug>(coc-diagnostic-next)
nmap <leader>cp <Plug>(coc-diagnostic-prev)

" go to definition
nmap <silent> gd <Plug>(coc-definition)
" go to declaration
nmap <silent> gi <Plug>(coc-declaration)
" go to implentation
nmap <silent> gi <Plug>(coc-implementation)
" go to type definition
nmap <silent> gt <Plug>(coc-type-definition)
" go to references
nmap <silent> grf <Plug>(coc-references)
" rename value at cursor
nmap <silent> gre <Plug>(coc-rename)
" format buffer
nmap <silent> gf <Plug>(coc-format)
" format selection (w/ motion, e.g. `gfmap` to format a paragraph
nmap <silent> gfs <Plug>(coc-format-selected)
" TODO: understand what code actions are (and code lens actions below)
" apply code action for current line
nmap <silent> gca <Plug>(coc-codeaction)
" apply code action to selection
nmap <silent> gcas <Plug>(coc-codeaction-selected)

" open link
" TODO: figure out what's wrong with below line (same problem as above)
" nmap  gx <Plug>(coc-openlink)

" apply code lens action on current line
nmap <silent> gcl <Plug>(coc-codelens-action)
" run quickfix action on current line
nmap <silent> gfc <Plug>(coc-fix-current)

" TODO: test this
" trigger key for going to the next snippet position,
" applied in insert and select mode.
" let g:coc_snippet_next = <c-n>
" let g:coc_snippet_prev = <c-p>
" expand snippet if possible (check out related options)
" inoremap <silent><expr> <c-e> coc#expandable()

" refresh completion at cursor
inoremap <silent><expr> <c-e> coc#refresh()

" TODO: look into below configuration options
"
" float window? - coc#util#has_float()
" locations? - CocLocationsAsync({id}, {method}, [{params}, {openCommand}])
"
