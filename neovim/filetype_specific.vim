augroup filetype_gitcommit
  autocmd!
  autocmd FileType gitcommit set textwidth=72 " wrap @ 72 characters
  autocmd Filetype gitcommit set colorcolumn=73
  autocmd FileType gitcommit syntax match gitcommitComment "^;.*"
augroup END

augroup filetype_make
  autocmd!
  autocmd FileType make set noexpandtab " insert tabs, not 2 spaces
augroup END

augroup filetype_gitconfig
  autocmd!
  autocmd FileType gitconfig set noexpandtab " insert tabs, not 2 spaces
augroup END

augroup filetype_markdown
  autocmd!
  autocmd FileType markdown setlocal colorcolumn=
augroup END

augroup filetype_python
  autocmd!
  autocmd Filetype python set colorcolumn=89
  autocmd Filetype python set textwidth=88
augroup END

augroup filetype_json
  autocmd!
  " mark json files as jsonc by default
  " refs:
  " - https://github.com/neoclide/jsonc.vim
  " - https://github.com/neoclide/jsonc.vim/blob/main/ftdetect/jsonc.vim
  autocmd Filetype json setlocal filetype=jsonc
augroup END

augroup filetype_jsonc
  autocmd!
  " the `jsonc` extension I use assumes `.cjson` as the extension. I'd rather
  " use `.jsonc`.
  " ref - https://github.com/neoclide/jsonc.vim/blob/main/ftdetect/jsonc.vim
  autocmd BufNewFile,BufRead *.jsonc setlocal filetype=jsonc
augroup END

augroup direnv
  autocmd!
  " `.envrc-*` files are ~bash - https://github.com/direnv/direnv#how-it-works
  autocmd BufNewFile,BufRead *envrc* setlocal filetype=bash
augroup END
