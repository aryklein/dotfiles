return {
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup({})
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = { "williamboman/mason-lspconfig.nvim" },
        config = function()
          require('ary.lsp')
          vim.api.nvim_exec_autocmds("FileType", {})
        end
    },
    {
      'hrsh7th/cmp-nvim-lsp'
    },
    {
      'hrsh7th/nvim-cmp'
    },
}
