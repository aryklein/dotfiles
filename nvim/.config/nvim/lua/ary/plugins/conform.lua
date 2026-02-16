return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format({ async = true, lsp_fallback = true })
      end,
      mode = 'n',
      desc = 'Format buffer',
    },
  },
  opts = {
    formatters_by_ft = {
      python = { 'ruff_format' },
      sh = { 'shfmt' },
      bash = { 'shfmt' },
      lua = { 'stylua' },
      go = { 'goimports' },
      terraform = { 'terraform_fmt' },
      tf = { 'terraform_fmt' },
      javascript = { 'prettier' },
      typescript = { 'prettier' },
      html = { 'prettier' },
      css = { 'prettier' },
      json = { 'prettier' },
      markdown = { 'prettier' },
      yaml = { 'yamlfmt' },
    },
  },
}
