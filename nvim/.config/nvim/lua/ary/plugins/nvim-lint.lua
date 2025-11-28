return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPost', 'BufWritePost' },
  config = function()
    local lint = require('lint')

    -- Define linters per filetype
    -- If a linter isn't installed, nvim-lint silently skips it
    lint.linters_by_ft = {
      python = { 'ruff' },
      sh = { 'shellcheck' },
      bash = { 'shellcheck' },
      yaml = { 'yamllint' },
      ansible = { 'ansible_lint' },
    }

    -- Run linters on save and when opening a file
    vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufWritePost' }, {
      group = vim.api.nvim_create_augroup('nvim-lint', { clear = true }),
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
