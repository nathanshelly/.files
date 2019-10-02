" <<<<<<<< colors >>>>>>>>

" TODO: look into changes to colors from true color support

" true color support
" ref - https://github.com/joshdick/onedark.vim#installation
if (has("termguicolors"))
  set termguicolors
endif

" background
set background=dark

" << colorscheme >>

" onedark.vim override: Don't set a background color when running in a terminal;
" just use the terminal's background color
" `gui` is the hex color code used in GUI mode/nvim true-color mode
" `cterm` is the color code used in 256-color mode
" `cterm16` is the color code used in 16-color mode
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    " `bg` will not be styled since there is no `bg` setting
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white })
  augroup END
endif

colorscheme onedark

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
