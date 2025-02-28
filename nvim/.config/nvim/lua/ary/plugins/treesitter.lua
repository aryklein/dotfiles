-- tree-sitter for Neovim
return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("ary.treesitter")
    end
}
