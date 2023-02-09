return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v1.x',
  lazy = false,
  priority = 51,
  dependencies = {
    -- LSP Support
    {'williamboman/mason.nvim'},           -- Optional
    {'williamboman/mason-lspconfig.nvim'}, -- Optional
    {'neovim/nvim-lspconfig'},             -- Required

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},         -- Required
    {'hrsh7th/cmp-nvim-lsp'},     -- Required
    {'hrsh7th/cmp-buffer'},       -- Optional
    {'hrsh7th/cmp-path'},         -- Optional
    {'saadparwaiz1/cmp_luasnip'}, -- Optional
    {'hrsh7th/cmp-nvim-lua'},     -- Optional

    -- Snippets
    {'L3MON4D3/LuaSnip'},             -- Required
    {'rafamadriz/friendly-snippets'}, -- Optional

    -- lspkind
    {'onsails/lspkind.nvim'}, -- Optional'},
  },
  config = function()
      require('ary.lsp-zero')
  end
}
