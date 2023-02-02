return require('packer').startup(function()

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- nightfox color scheme
  use "EdenEast/nightfox.nvim"

  -- file explorer for Neovim written in Lua
  use {
      'nvim-tree/nvim-tree.lua',
      requires = {
          'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
  }

  -- status line (vim-airline replacement)
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 
          'nvim-tree/nvim-web-devicons',
      },
  }

  -- tree-sitter for Neovim
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }

  -- smart and powerful comment plugin 
  use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }

  -- Go language support for Vim
  use {
      'fatih/vim-go',
      run = ':GoUpdateBinaries'
  }

  -- telescope
  use {
      'nvim-telescope/telescope.nvim',
      requires = { 'nvim-lua/plenary.nvim'
      }
  }

  -- FZF sorter for telescope written in C
  use {
      'nvim-telescope/telescope-fzf-native.nvim', 
      run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  }

  use {
      'VonHeikemen/lsp-zero.nvim',
      requires = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},
          {'williamboman/mason.nvim'},
          {'williamboman/mason-lspconfig.nvim'},

          -- Autocompletion
          {'hrsh7th/nvim-cmp'},
          {'hrsh7th/cmp-buffer'},
          {'hrsh7th/cmp-path'},
          {'saadparwaiz1/cmp_luasnip'},
          {'hrsh7th/cmp-nvim-lsp'},
          {'hrsh7th/cmp-nvim-lua'},

          -- Snippets
          {'L3MON4D3/LuaSnip'},
          -- Snippet Collection (Optional)
          {'rafamadriz/friendly-snippets'},

          -- lspkind
          {'onsails/lspkind-nvim'},
      }
  }

--  -- autopairs for neovim written in LUA
--  use 'windwp/nvim-autopairs'

  use 'tpope/vim-fugitive'

  -- git decorations
  use {
      'lewis6991/gitsigns.nvim',
      config = function()
          require('gitsigns').setup()
      end
  }

  use 'github/copilot.vim'

end)
