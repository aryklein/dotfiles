-- tree-sitter for Neovim
return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require('ary.treesitter')
  end,
}
