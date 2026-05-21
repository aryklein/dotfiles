local parsers = {
  'bash',
  'yaml',
  'html',
  'python',
  'json',
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
  'markdown_inline',
  'make',
  'diff',
}

require('nvim-treesitter').setup()
require('nvim-treesitter').install(parsers)

vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})
