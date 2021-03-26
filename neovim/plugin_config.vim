" <<<<<< motions/operators >>>>>>

" <<<< vim-surround >>>>
" ref - https://github.com/tpope/vim-surround#surroundvim

" << keymap >>

" add keystrokes to surround with `<>`
" e.g. `ysss` surrounds the current line w/ `<>` w/o spaces, `yssS` surrounds w/
" `<>` w/ spaces
let g:surround_{char2nr('s')} = "<\r>"
let g:surround_{char2nr('S')} = "< \r >"

" <<<<<< utilities >>>>>>

" <<<< nerdtree >>>>
" ref - https://github.com/scrooloose/nerdtree#faq-here-and-in-the-wiki
noremap <c-n> :NERDTreeToggle<CR>
" highlight current file in tree
noremap <leader>ntf :NERDTreeFind<CR>

" <<<< git-p.nvim (git info) >>>>
" ref - https://github.com/iamcco/git-p.nvim#usage--config

" << options >>

let g:gitp_blame_format = '  %{account} ~ %{ago} • %{commit}'

" << keymap >>

" use <leader>gd to display change
nnoremap <leader>gd <plug>(git-p-diff-preview)

" <<<< rhysd/git-messenger.vim (view git blame commit) >>>>
" show diff of current file in popup
let g:git_messenger_include_diff = "current"

" <<<< goyo.vim & limelight.vim >>>>
" refs:
"   - https://github.com/junegunn/limelight.vim#options
"   - https://github.com/junegunn/goyo.vim#configuration

" << options >>

" TODO: figure out why I can't pass an argument, what passing an argument should
" do, and how to background text fully dark
" https://github.com/junegunn/limelight.vim/issues/27
let g:limelight_conceal_ctermfg = 'Black'

" goyo integration
" TODO: clean up below autocommands
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" reset colors on exiting goyo (workaround)
" refs:
"   - https://github.com/junegunn/goyo.vim/issues/160
"   - https://github.com/junegunn/goyo.vim/pull/195
autocmd! User GoyoLeave source $MYVIMRC

let g:goyo_height = '66%'
let g:goyo_width = '100%'

" << keymap >>

nnoremap <leader>jg :Goyo<CR>
nnoremap <leader>jl :Limelight!!<CR>

" <<<< vim-gh-line >>>>
" ref - https://github.com/ruanyl/vim-gh-line#how-to-use

" << options >>

let g:gh_line_map = '<leader>mgl' " `mgl` for `misc git link`
let g:gh_line_blame_map = '<leader>mgb' " `mgb` for `misc git blame`

" <<<< lightline >>>>
" ref - https://github.com/itchyny/lightline.vim#colorscheme-configuration
let g:lightline = {
  \ 'colorscheme': 'onehalfdark',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'readonly', 'filename', 'modified' ],
  \             [ 'cocstatus', 'currentfunction' ] ]
  \ },
  \ 'component_function': {
  \   'readonly': 'LightlineReadonly',
  \   'filename': 'LightlineFilename',
  \   'cocstatus': 'coc#status',
  \   'currentfunction': 'CocCurrentFunction'
  \ },
\ }

" ref - https://github.com/itchyny/lightline.vim/issues/293#issuecomment-373710096
function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

" hide readonly component in help pages
" https://github.com/itchyny/lightline.vim#can-i-hide-the-readonly-component-in-the-help-buffer
function! LightlineReadonly()
  return &readonly && &filetype !=# 'help' ? 'RO' : ''
endfunction

" <<<< markdown-preview >>>>

nnoremap <leader>mp :MarkdownPreview<CR>

" <<<<<< end of utilities >>>>>>

" <<<<<< colors/syntax/languages >>>>>>

" <<<< vim-polyglot >>>>

" << options >>
" disable `markdown` to use `tpop/vim-markdown` configured below
let g:polyglot_disabled = ['markdown']

" <<<< vim-markdown >>>>
" use `tpope`, not `plasticboy` from `vim-polyglot`

" << options >>

let g:markdown_fenced_languages = [
  \ 'javascript',
  \ 'typescript',
  \ 'python',
  \ 'bash=sh',
  \ 'sh'
\]

" <<<< vCoolor.vim >>>>
" ref - https://github.com/KabbAmine/vCoolor.vim#customization
let g:vcoolor_disable_mappings = 1
let g:vcoolor_map = '<m-c>' " already the default, added here just for context

" <<<< Colorizer >>>>
" ref - https://github.com/chrisbra/Colorizer

" automatically highlight in css files
autocmd BufNewFile,BufRead *.css :ColorHighlight!

" highlight manually via shortcut
nnoremap <leader>ch :ColorHighlight<CR>

" highlight only color codes, not color names - '#ffffff' not 'white'
let g:colorizer_colornames = 0

" <<<< treesitter >>>>

" ref - https://github.com/nvim-treesitter/nvim-treesitter#modules
lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "maintained",
  highlight = { enable = true },
  incremental_selection = { enable = true },
  indent = { enable = true },
  playground = { enable = true }
}
EOF
