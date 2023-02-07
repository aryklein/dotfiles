local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require('lazy').setup({

  -- nightfox color scheme
  'EdenEast/nightfox.nvim',

  -- file explorer for Neovim written in Lua
  { 'nvim-tree/nvim-tree.lua',
      dependencies = {
          'nvim-tree/nvim-web-devicons', -- optional, for file icons
      }
  },

  -- status line (vim-airline replacement)
  {
      'nvim-lualine/lualine.nvim',
      dependencies = {
          'nvim-tree/nvim-web-devicons',
      }
  },

  -- tree-sitter for Neovim
  {
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate'
  },

  -- smart and powerful comment plugin 
  {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  },

  -- Go language support for Vim
  {
      'fatih/vim-go',
      build = ':GoUpdateBinaries'
  },

  -- telescope
  {
      'nvim-telescope/telescope.nvim',
      dependencies = { 'nvim-lua/plenary.nvim'
      }
  },

  -- FZF sorter for telescope written in C
  {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  },

  {
      'VonHeikemen/lsp-zero.nvim',
      dependencies = {
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
  },


  'tpope/vim-fugitive',

  -- git decorations
  {
      'lewis6991/gitsigns.nvim',
      config = function()
          require('gitsigns').setup()
      end
  },

  'github/copilot.vim',

  }

)
