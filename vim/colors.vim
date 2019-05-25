" <<<<<<<< colors >>>>>>>>

" background
set background=dark

" colorscheme
colorscheme onedark

" 256 color
set t_Co=256

" << miscellaneous >>

" lighten line numbers for increased visibility
hi LineNr ctermfg=240

" darken colorcolumn for decreased visibility
hi ColorColumn ctermbg=235

" << highlighting >>

" search
hi Search cterm=None ctermfg=black ctermbg=cyan
hi IncSearch cterm=None ctermfg=black ctermbg=cyan

" matching
hi MatchParen cterm=None ctermfg=cyan ctermbg=None

" transparent background
hi Normal ctermbg=None

" << whitespace >>

 " whitespace group coloring
hi ExtraWhitespace ctermbg=magenta
" keep through color scheme change
au ColorScheme * hi ExtraWhitespace ctermbg=magenta
" highlight all trailing whitespace
au BufRead,InsertLeave * match ExtraWhitespace /\s\+$/
" avoid highlighting trailing whitespace on current line when editing at the end
" of it
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/

" << syntax groups >>

" match Tabs on file load (just matches, no highlighting yet)
au BufRead * syntax match Tab /\t/
