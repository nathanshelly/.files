" <<<< File Specific >>>>

" << git >>

" commit message subject line wrap and color
autocmd FileType gitcommit set textwidth=72
autocmd Filetype gitcommit set colorcolumn=73
autocmd FileType gitcommit hi gitCommitSummary ctermfg=blue

" << makefile >>

" insert tabs, not 2 spaces
autocmd FileType make set noexpandtab

" << markdown >>

autocmd FileType markdown set colorcolumn=

" << python >>

autocmd Filetype python set colorcolumn=89
autocmd Filetype python set textwidth=88

" << vim >>

autocmd Filetype vim set textwidth=80

" << json >>

" mark json files as jsonc by default
" refs:
" - https://github.com/neoclide/jsonc.vim
" - https://github.com/neoclide/jsonc.vim/blob/master/ftdetect/jsonc.vim
autocmd BufNewFile,BufRead *.json setlocal filetype=jsonc
