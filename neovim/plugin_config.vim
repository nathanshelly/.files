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

" <<<< markdown-preview >>>>

nnoremap <leader>mp :MarkdownPreview<CR>

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
