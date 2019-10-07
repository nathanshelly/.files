" <<<<<<<< colors >>>>>>>>

" TODO: look into changes to colors from true color support

" true color support
" note: with true color support on, must specify highlights with guifg/bf
" ref - https://github.com/joshdick/onedark.vim#installation
if (has("termguicolors"))
  set termguicolors
endif

colorscheme onedark

" background
set background=dark
" disable background color potentially set by colorscheme
" ref - https://vi.stackexchange.com/a/16136
hi Normal ctermbg=None guibg=None

" << miscellaneous >>

" darken colorcolumn for decreased visibility
hi ColorColumn ctermbg=235 guibg=#111112

" search
hi Search cterm=None ctermfg=black ctermbg=cyan guibg=#89CFF0 guifg=#000000
hi IncSearch cterm=None ctermfg=black ctermbg=cyan guibg=#89CFF0 guifg=#000000

" matching
hi MatchParen cterm=None ctermfg=cyan ctermbg=None guibg=#808080 guifg=#89CFF0 gui=none

" << whitespace >>

 " whitespace group coloring
hi ExtraWhitespace ctermbg=magenta guibg=#ff00ff
" keep through color scheme change
au ColorScheme * hi ExtraWhitespace ctermbg=magenta guibg=#ff00ff
" highlight all trailing whitespace
" TODO: check why this seemed to break
au BufRead,InsertLeave * match ExtraWhitespace /\s\+$/
" avoid highlighting trailing whitespace on current line when editing at the end
" of it
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/

" << syntax groups >>

" match Tabs on file load (just matches, no highlighting yet)
au BufRead * syntax match Tab /\t/
