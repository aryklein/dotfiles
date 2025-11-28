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
  'make',
  'diff',
}

require('nvim-treesitter').setup()
require('nvim-treesitter').install(parsers)

vim.api.nvim_create_autocmd("FileType", {
  pattern = parsers,
  callback = function()
    pcall(vim.treesitter.start)
  end,
})
