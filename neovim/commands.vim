" <<<<<<<< Commands >>>>>>>>

" tab highlight and unhighlight
command! HiTab hi Tab ctermbg=blue
command! NoHiTab hi Tab ctermbg=None

" strip whitespace
" ref - https://vi.stackexchange.com/a/456
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
command! TrimWhitespace call TrimWhitespace()

" run a given vim command on the results of alt from a given path
" mapped to `<leader> .`
" ref - https://github.com/uptech/alt/#use-with-vim
fun! AltCommand(path, vim_command)
  let l:alternate = system("alt " . a:path)
  if empty(l:alternate)
    echo "No alternate file for " . a:path . " exists!"
  else
    exec a:vim_command . " " . l:alternate
  endif
endfun
