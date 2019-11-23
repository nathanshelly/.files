" <<<< File Specific >>>>

" << git >>

" commit message subject line wrap and color
au FileType gitcommit set textwidth=72
au Filetype gitcommit set colorcolumn=73
au FileType gitcommit hi gitCommitSummary ctermfg=blue

" << makefile >>

" insert tabs, not 2 spaces
au FileType make set noexpandtab

" << markdown >>

au FileType markdown set colorcolumn=

" << python >>

au Filetype python set colorcolumn=89
au Filetype python set textwidth=88

" << vim >>

au Filetype vim set textwidth=80

" << json >>

" mark json files as jsonc by default
" refs:
" - https://github.com/neoclide/jsonc.vim
" - https://github.com/neoclide/jsonc.vim/blob/master/ftdetect/jsonc.vim
autocmd BufNewFile,BufRead *.json setlocal filetype=jsonc
