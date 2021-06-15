" <<<<<< motions/operators >>>>>>

" <<<<<< utilities >>>>>>

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

" <<<< nvim-treesitter >>>>

" TODO: remove this once nvim-treesitter version in `nixpkgs` updated
" ref - https://github.com/nvim-treesitter/nvim-treesitter#modules
lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "maintained",
  highlight = { enable = true, disable = { "elixir" } },
  incremental_selection = { enable = true, disable = { "elixir" } },
  indent = { enable = true, disable = { "elixir" } },
  playground = { enable = true, disable = { "elixir" } },
}
EOF

" <<<< investigate.vim >>>>
" ref - https://github.com/keith/investigate.vim#dash

let g:investigate_use_dash=1

" <<<<<< end of utilities >>>>>>

" <<<<<< colors/syntax/languages >>>>>>

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
" ref - https://github.com/norcalli/nvim-colorizer.lua

lua require'colorizer'.setup()

" toggle highlighting
nnoremap <leader>ct :ColorizerToggle<CR>
