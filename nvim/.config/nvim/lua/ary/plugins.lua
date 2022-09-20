return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- nightfox color scheme
  use "EdenEast/nightfox.nvim"

  -- Ansible VIM plugin
  use 'pearofducks/ansible-vim'

  -- file explorer for Neovim written in Lua
  use {
    'kyazdani42/nvim-tree.lua',
    require = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons'
    },
  }

  -- status line (vim-airline replacement)
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 
      'kyazdani42/nvim-web-devicons',
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

  -- Configurations for Nvim LSP
  use 'neovim/nvim-lspconfig'

  -- completion plugins for neovim.
  use {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      'onsails/lspkind.nvim',
  }

  -- autopairs for neovim written in LUA
  use 'windwp/nvim-autopairs'

  use 'tpope/vim-fugitive'

  -- git decorations
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

end)
