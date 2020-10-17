{
  # someday may manage other gui configs via nix but immutability prevents
  # editing settings via the gui which is a dealbreaker for me at the moment
  home.file = {
    ".xvimrc".text = ''
      " Options

      set wrap
      set number

      set incsearch
      set hlsearch

      set ignorecase
      set smartcase

      " Mappings

      inoremap jk <esc>

      nnoremap J }
      vnoremap J }
      nnoremap K {
      vnoremap K {

      nnoremap z $
      vnoremap z $h
      nnoremap Z ^
      vnoremap Z ^

      nmap == :xcmenucmd Re-Indent<CR>
      vmap = :xcmenucmd Re-Indent<CR>

      nmap <C-i> :xcmenucmd Go Forward<CR>
      nmap <C-o> :xcmenucmd Go Back<CR>

      nmap <C-z> :xcmenucmd Open in Next Editor<CR>
      nmap <C-q> :xcmenucmd Close Editor<CR>:xcmenucmd Move Focus to Next Editor<CR>
    '';
  };
}
