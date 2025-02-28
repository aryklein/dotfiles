local treesitter = require('nvim-treesitter.configs')

treesitter.setup({
  highlight = {
    enable = true,
  },
  ensure_installed = {
    'bash',
    'yaml',
    'html',
    'python',
    'json',
    'vim',
    'lua',
    'dockerfile',
    'go',
    'hcl',
    'comment',
    'sql',
    'toml',
    'c',
    'terraform',
    'gitcommit',
    'gitignore',
    'markdown',
    'make',
  },
})
