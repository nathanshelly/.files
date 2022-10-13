--[
-- plugins are loaded after all of one's vim config is evaluated. this means
-- variables like `g.loaded_<plugin>` are falsy until after the vim configu has
-- been evaluated. in order to use these variables to gracefully degrade when
-- a given plugin is not installed or erroring we need to execute the relevant
-- code after plugins have been loaded. to do so we use the VimEnter event which
-- triggers post all startup code running
--
-- # ref: https://vimdoc.sourceforge.net/htmldoc/autocmd.html#VimEnter
--]
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  pattern = "*",
  callback = function()
    -- <<<<<< utilities >>>>>>

    -- TODO: support conditional loading
    require('silicon').setup({
      -- TODO: tweak these
      font = 'Natasha I=16',
      -- theme = 'Monokai Extended',
    })

    -- <<<< nvim-treesitter >>>>

    -- only call setup steps if plugin installed
    -- this variable set on load, see following command to list global variables
    -- echo copy(g:)->filter('v:key =~# "^loaded_"')
    if vim.g.loaded_nvim_treesitter then
      -- TODO: remove this once nvim-treesitter version in `nixpkgs` updated
      -- ref - https://github.com/nvim-treesitter/nvim-treesitter#modules
      require 'nvim-treesitter.configs'.setup {
        -- "all", "maintained" (parsers with maintainers), or a list of languages
        ensure_installed = {
          "c", "bash", "cpp", "dockerfile", "go", "html", "javascript", "jsdoc",
          "json", "json5", "jsonc", "lua", "make", "markdown",
          "markdown_inline", "make", "nix", "pug", "python", "ruby", "rust",
          "sql", "svelte", "swift", "tsx", "typescript", "vim", "yaml"
        },
        auto_install = true,
        highlight = { enable = true, disable = { "elixir" } },
        incremental_selection = { enable = true, disable = { "elixir" } },
        indent = { enable = true, disable = { "elixir" } },
        playground = { enable = true, disable = { "elixir" } },
      }
    end

    -- <<<< feline-nvim >>>>

    -- echo copy(g:)->filter('v:key =~# "^WebDev"')

    require 'nvim-web-devicons'.setup {}
    require('lualine').setup({
      options = { theme = 'tokyonight' },
    })

    -- <<<< lightline >>>>
    -- ref - https://github.com/itchyny/lightline.vim#colorscheme-configuration
    -- let g:lightline = {
    --   \ 'colorscheme': 'onehalfdark',
    --   \ 'active': {
    --   \   'left': [ [ 'mode', 'paste' ],
    --   \             [ 'readonly', 'filename', 'modified' ],
    --   \             [ 'cocstatus', 'currentfunction' ] ]
    --   \ },
    --   \ 'component_function': {
    --   \   'readonly': 'LightlineReadonly',
    --   \   'filename': 'LightlineFilename',
    --   \   'cocstatus': 'coc#status',
    --   \   'currentfunction': 'CocCurrentFunction'
    --   \ },
    -- \ }

    -- ref - https://github.com/itchyny/lightline.vim/issues/293#issuecomment-373710096
    -- function! LightlineFilename()
    --   let root = fnamemodify(get(b:, 'git_dir'), ':h')
    --   let path = expand('%:p')
    --   if path[:len(root)-1] ==# root
    --     return path[len(root)+1:]
    --   endif
    --   return expand('%')
    -- endfunction

    -- hide readonly component in help pages
    -- https://github.com/itchyny/lightline.vim#can-i-hide-the-readonly-component-in-the-help-buffer
    -- function! LightlineReadonly()
    --   return &readonly && &filetype !=# 'help' ? 'RO' : ''
    -- endfunction
    -- if vim.g.loaded_feline then
    -- end

    -- <<<< nvim-tree >>>>
    -- ref: https://github.com/nvim-tree/nvim-tree.lua#setup

    -- if vim.g.loaded_nvim_tree then
    vim.g.loaded = 1
    vim.g.loaded_netrwPlugin = 1
    require("nvim-tree").setup({
      sort_by = "case_sensitive",
      view = {
        adaptive_size = true,
        mappings = {
          list = {
            { key = "u", action = "dir_up" },
          },
        },
      },
      renderer = { group_empty = true },
      filters = { dotfiles = true },
    })
    -- end
    -- # file explorer
    -- {
    --   plugin = nerdtree;
    --   config = ''
    --     " ref - https://github.com/scrooloose/nerdtree#faq-here-and-in-the-wiki
    --     noremap <c-n> :NERDTreeToggle<CR>

    --     " highlight current file in tree
    --     noremap <leader>ntf :NERDTreeFind<CR>
    --   '';
    -- }

    -- <<<< which-key.nvim >>>>
    -- TODO: configure this - https://github.com/folke/which-key.nvim#%EF%B8%8F-configuration
    -- require("which-key").setup {}

    -- <<<< noice.nvim >>>>
    -- TODO: configure - https://github.com/folke/noice.nvim#%EF%B8%8F-configuration
    -- https://github.com/folke/noice.nvim/wiki/Configuration-Recipes
    require("noice").setup()

    -- <<<< todo-comments.nvim >>>>
    require("todo-comments").setup()

    -- <<<< trouble >>>>
    -- asdf


    -- <<<<<< end of utilities >>>>>>

    -- <<<<<< colors/syntax/languages >>>>>>

    -- <<<< tokyonight >>>>
    require("tokyonight").setup({
      -- your configuration comes here
      -- or leave it empty to use the default settings
      style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
      light_style = "day", -- The theme is used when the background is set to light
      transparent = false, -- Enable this to disable setting the background color
      terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "dark", -- style for sidebars, see below
        floats = "dark", -- style for floating windows
      },
      sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
      day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
      hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
      dim_inactive = true, -- dims inactive windows
      lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

      --- You can override specific color groups to use other groups or a hex color
      --- function will be called with a ColorScheme table
      on_colors = function(colors)
        colors.bg = "#000000"
        -- colors.bg_dark = "#000000"
        -- colors.bg_float = "#000000"
        -- colors.bg_highlight = "#000000"
        -- colors.bg_popup = "#000000"
        -- colors.bg_search = "#000000"
        -- colors.bg_sidebar = "#000000"
        -- colors.bg_statusline = "#000000"
        -- colors.bg_visual = "#000000"

        -- colors.bg = "#000000"
        -- colors.error = "#0f0000"
      end,

      --- You can override specific highlights to use other groups or a hex color
      --- function will be called with a Highlights and ColorScheme table
      on_highlights = function(highlights, colors) end,
    })
    vim.cmd [[colorscheme tokyonight]]

    -- <<<< nvim-highlight-colors >>>>
    -- ref - https://github.com/norcalli/nvim-colorizer.lua
    if vim.fn.has("termguicolors") and vim.g.loaded_nvim_highlight_colors then
      -- vim.opt.termguicolors = true
      -- require'colorizer'.setup()
      require('nvim-highlight-colors').setup {}
      -- TODO: understand why this is necessary on file load but not buffer reload
      require("nvim-highlight-colors").turnOn()

      -- toggle highlighting
      vim.api.nvim_set_keymap('n', '<leader>ct', ':HighlightColorsToggle<CR>', { noremap = true })
    end
  end,
})
