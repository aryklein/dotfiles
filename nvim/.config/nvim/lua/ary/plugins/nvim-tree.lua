return {
  'nvim-tree/nvim-tree.lua',
  cmd = { 'NvimTreeToggle', 'NvimTreeOpen' },
  dependencies = {
    {
      'nvim-tree/nvim-web-devicons',
      config = true 
    }
  },
  config = function()
      require("ary.nvim-tree")
  end
}
