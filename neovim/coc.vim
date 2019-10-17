" TODO: understand this
" highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

" << completion >>
" ref - https://github.com/neoclide/coc.nvim/wiki/Completion-with-sources#improve-completion-experience

" trigger completion w/ <c-s>
inoremap <silent><expr> <c-s> coc#refresh()

" confirm completion w/ <c-space>
" `<c-g>u` means break undo chain at current position
" TODO: make space a completion character when an option is selected
inoremap <expr> <c-space> pumvisible() ? coc#_select_confirm() : "\<c-g>u\<c-space>"

" move up and down preview window
" TODO: understand why `pumvisible` behavior seems different here vs `<c-space>`
inoremap <expr> <c-k> "\<c-n>"
inoremap <expr> <c-l> "\<c-p>"
" inoremap <expr> <c-k> pumvisible() ? "\<C-n>" : "\<c-k>"
" inoremap <expr> <c-l> pumvisible() ? "\<C-p>" : "\<c-l>"

" NOTE: namespace less important command with `<leader>c`
" NOTE: `<Plug>` mappings used to route command to plugins
" ref - https://www.reddit.com/r/vim/comments/78izt4/please_help_understand_how_to_use_plug_mapping/

" double `<cr>` to skip confirmation prompt
nmap <leader>cr :CocRestart<cr><cr>

" show diagnostic information
" TODO: figure out what's wrong with below line
" nmap <leader>cd <Plug>(coc-diagnostic-info)
" move between diagnostics
nmap <leader>cn <Plug>(coc-diagnostic-next)
nmap <leader>cp <Plug>(coc-diagnostic-prev)

" go to definition
nmap <silent> gd <Plug>(coc-definition)
" go to declaration
nmap <silent> gr <Plug>(coc-declaration)
" go to implentation
nmap <silent> gi <Plug>(coc-implementation)
" go to type definition
nmap <silent> gt <Plug>(coc-type-definition)
" go to references
nmap <silent> grf <Plug>(coc-references)
" rename value at cursor
nmap <silent> grn <Plug>(coc-rename)
" format buffer
nmap <silent> gfb <Plug>(coc-format)
" TODO: evaluate use of `co` namespace depending on usage patterns
" TODO: understand what code actions are (and code lens actions below)
" apply code action for current line
nmap <silent> coa <Plug>(coc-codeaction)

" open link
" TODO: figure out what's wrong with below line (same problem as above)
" nmap  gx <Plug>(coc-openlink)

" apply code lens action on current line
nmap <silent> col <Plug>(coc-codelens-action)
" run quickfix action on current line
nmap <silent> gfc <Plug>(coc-fix-current)

" << variables >>

" extensions
"
" ref - https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions
"
" can also install through plugin manager, here's an example w/ vim plug
" `Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}`
"
" available extensions - https://www.npmjs.com/search?q=keywords%3Acoc.nvim
" extra sources - https://github.com/neoclide/coc-sources
"
" TODO: configure extensions, set up required language servers
" `coc-rls`: rust
" `coc-tsserver`: requires no separate language server
let g:coc_global_extensions = [
  \ 'coc-css',
  \ 'coc-diagnostic',
  \ 'coc-eslint',
  \ 'coc-html',
  \ 'coc-jest',
  \ 'coc-json',
  \ 'coc-prettier',
  \ 'coc-python',
  \ 'coc-rls',
  \ 'coc-tsserver',
\ ]

" trigger key for going to the next snippet position,
" applied in insert and select mode.
let g:coc_snippet_next = '<c-n>'
let g:coc_snippet_prev = '<c-p>'

" expand snippet if possible (check out related options)
" inoremap <silent><expr> <c-e> coc#expandable()

" TODO: look into below configuration options
" don't give |ins-completion-menu| messages -  `set shortmess+=c`
" coc#on_enter (also smart braces?)
" coc#status (statusline integration)
" coc#util#float_scrollable - (how to scroll floating window?)
" locations? - CocLocationsAsync({id}, {method}, [{params}, {openCommand}])
" CocActionAsync ("Available Actions") (how does this map to `<Plug>` actions,
" 1:1?)
"   -  `pickColor`? `colorPresentation`?

" TODO: look at CocList commands, configuration, mappings & sources
nmap <silent> <c-s> :CocList<CR>

" TODO: possible keybindings below
" " Show all diagnostics
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" " Show commands
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" << commands >>
command! -nargs=0 Prettier :CocCommand prettier.formatFile
