-- tree-sitter for Neovim
return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require("ary.treesitter")
    end
}
