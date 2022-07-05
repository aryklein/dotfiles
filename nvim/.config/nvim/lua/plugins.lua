return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- -- dracula color scheme
  -- use {
  --   'dracula/vim', 
  --   as = 'dracula'
  -- }

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
    tag = 'nightly' -- optional, updated every week.
  }

  -- status line (vim-airline replacement)
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 
      'kyazdani42/nvim-web-devicons',
      opt = true 
    },
    config = function()
      require('lualine').setup()
    end
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
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- FZF sorter for telescope written in C
  use {
    'nvim-telescope/telescope-fzf-native.nvim', 
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  }

  -- Configurations for Nvim LSP
  use 'neovim/nvim-lspconfig'

  -- completion plugin for neovim.
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'onsails/lspkind.nvim'

  -- autopairs for neovim written in LUA
  use 'windwp/nvim-autopairs'

  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'

end)
