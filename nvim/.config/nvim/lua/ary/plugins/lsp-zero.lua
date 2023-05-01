return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    lazy = false,
    priority = 51,
    dependencies = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {                                      -- Optional
            'williamboman/mason.nvim',
            build = ":MasonUpdate",
        },
        {'williamboman/mason-lspconfig.nvim'}, -- Optional
        -- Autocompletion
        -- Required
        {'hrsh7th/nvim-cmp'},                  -- Required
        {'hrsh7th/cmp-nvim-lsp'},              -- Required
        {'L3MON4D3/LuaSnip'},                  -- Required
        -- lspkind
        {'onsails/lspkind.nvim'},              -- Optional
    },
    config = function()
        require('ary.lsp-zero')
    end
}
