" <<<<<<<< colors >>>>>>>>

" true color support
" note: with true color support on, must specify highlights with guifg/bf
if (has("termguicolors"))
  set termguicolors
endif

" source locally stored colorscheme, in future may break this out to a repo
source $DOTFILES/neovim/colorschemes/n.vim

" << miscellaneous >>

" darken colorcolumn for decreased visibility
highlight ColorColumn ctermbg=235 guibg=#111112

" search
highlight Search cterm=NONE ctermfg=black ctermbg=cyan guibg=#89CFF0 guifg=#000000
highlight IncSearch cterm=NONE ctermfg=black ctermbg=cyan guibg=#89CFF0 guifg=#000000

" matching
highlight MatchParen cterm=NONE ctermfg=cyan ctermbg=NONE guibg=#808080 guifg=#89CFF0 gui=none

" make comments italic
highlight Comment cterm=italic gui=italic

" << whitespace >>

" whitespace group coloring
highlight ExtraWhitespace ctermbg=magenta guibg=#ff00ff
" keep through color scheme change
augroup whitespace_highlighting
  autocmd!
  " rehighlight on color scheme change
  autocmd ColorScheme * highlight ExtraWhitespace ctermbg=magenta guibg=#ff00ff
  " highlight all trailing whitespace
  " TODO: check why this seemed to break
  autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/
  " avoid highlighting trailing whitespace on current line when editing at the end
  " of it
  autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
augroup END

" << syntax groups >>

" match Tabs on file load (just matches, no highlighting yet)
augroup tabs_match
  autocmd!
  autocmd BufRead * syntax match Tab /\t/
augroup END
