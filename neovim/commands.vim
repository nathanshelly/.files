" <<<<<<<< Commands >>>>>>>>

" tab highlight and unhighlight
command! HiTab highlight Tab ctermbg=blue
command! NoHiTab highlight Tab ctermbg=None

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

" Temporary workaround to enable open URL under cursor via `gx`
" https://github.com/vim/vim/issues/4738#issuecomment-798790444
if has('macunix')
  function! OpenURLUnderCursor()
    let s:uri = expand('<cWORD>')
    let s:uri = matchstr(s:uri, '[a-z]*:\/\/[^ >,;()]*')
    let s:uri = substitute(s:uri, '?', '\\?', '')
    let s:uri = shellescape(s:uri, 1)
    if s:uri != ''
      silent exec "!open '".s:uri."'"
      :redraw!
    endif
  endfunction
  nnoremap gx :call OpenURLUnderCursor()<CR>
endif
