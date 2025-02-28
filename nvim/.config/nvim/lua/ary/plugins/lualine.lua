return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    {
      'nvim-tree/nvim-web-devicons',
       config = true,
    }
  },
  name = 'lualine',
  event = "VeryLazy",
  opts = {
    config = {
      theme = 'auto',
    },
  },
}
