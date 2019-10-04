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
