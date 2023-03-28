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

    -- <<<< nvim- >>>>

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

        -- requires additional plugin installed. any way to check that the
        -- relevant plugin has been installed?
        refactor = {
          highlight_definitions = {
            enable = true,
            -- Set to false if you have an `updatetime` of ~100.
            clear_on_cursor_move = true,
          },
          smart_rename = {
            enable = true,
            keymaps = {
              smart_rename = "grf",
            },
          },
          navigation = {
            enable = true,
            keymaps = {
              goto_definition = "gnd",
              list_definitions = "gnD",
              list_definitions_toc = "gO",
              -- <Option|Alt-*|#>
              goto_next_usage = "<a-*>",
              goto_previous_usage = "<a-#>",
            },
          },
        },
      }
    end

    -- <<<< feline-nvim >>>>

    -- echo copy(g:)->filter('v:key =~# "^WebDev"')

    require 'nvim-web-devicons'.setup {}
    require('lualine').setup({
      options = { theme = 'tokyonight' },
    })

    -- TODO: investigate using noice w/ lualine
    -- sections = {
    --   lualine_x = {
    --     {
    --       require("noice").api.statusline.message.get_hl,
    --       cond = require("noice").api.statusline.message.has,
    --     },
    --     {
    --       require("noice").api.statusline.command.get,
    --       cond = require("noice").api.statusline.command.has,
    --       color = { fg = "#ff9e64" },
    --     },
    --     {
    --       require("noice").api.statusline.mode.get,
    --       cond = require("noice").api.statusline.mode.has,
    --       color = { fg = "#ff9e64" },
    --     },
    --     {
    --       require("noice").api.statusline.search.get,
    --       cond = require("noice").api.statusline.search.has,
    --       color = { fg = "#ff9e64" },
    --     },
    --   },
    -- },

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
    -- ref: https://github.com/folke/noice.nvim#-installation
    -- TODO: load this conditionally
    -- if vim.g.loaded_noice then
    require("noice").setup({
      sp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
    })
    -- end

    -- <<<< telescope.nvim >>>>
    --
    -- TODO: investigate - https://github.com/cljoly/telescope-repo.nvim
    if vim.g.loaded_telescope then
      -- TODO: figure out how to load extensions
      local telescope = require('telescope');
      -- ref: https://github.com/nvim-telescope/telescope-fzf-native.nvim#telescope-setup-and-configuration
      telescope.setup({
        extensions = {
          emoji = {
            action = function(emoji)
              vim.fn.setreg("e", emoji.value)
              vim.api.nvim_put({ emoji.value }, 'c', false, true)
            end,
          },
          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          },
          glyph = {
            action = function(glyph)
              vim.fn.setreg("g", glyph.value)
              vim.api.nvim_put({ glyph.value }, 'c', false, true)
            end,
          },
          noice = {}
        }
      })
      telescope.load_extension('fzf');
      telescope.load_extension('noice');
      telescope.load_extension("emoji")
      telescope.load_extension("glyph")
      telescope.load_extension("gh")
      -- telescope.load_extension("telescope-code-fence")
      telescope.load_extension("xray23")

      require "octo".setup()

      vim.api.nvim_set_keymap('n', '<c-t>', ':Telescope<cr>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<c-b>', ':Telescope buffers<cr>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<c-f>', ':Telescope live_grep<cr>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<c-g>', ':Telescope git_files<cr>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<c-p>', ':Telescope find_files<cr>', { noremap = true })
    end

    require('flow').setup {
      output = {
        buffer = true,
        split_cmd = '20split',
      },
    }

    -- <<<< todo-comments.nvim >>>>
    require("todo-comments").setup()

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
