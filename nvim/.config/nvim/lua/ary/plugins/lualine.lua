return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    {
      'nvim-tree/nvim-web-devicons',
       config = true,
    }
  },
  name = 'lualine',
  opts = {
    config = {
      theme = 'auto',
    },
  },
}
