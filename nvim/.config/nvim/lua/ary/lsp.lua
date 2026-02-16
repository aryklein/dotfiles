--- LSP configuration for Neovim

-- Merge LSP capabilities with blink.cmp
-- https://cmp.saghen.dev/installation#merging-lsp-capabilities
local capabilities = {
  textDocument = {
    foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    },
  },
}
capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

-- Set default capabilities for all LSP servers
vim.lsp.config('*', {
  capabilities = capabilities,
})

-- Enable LSP servers (configs in lsp/*.lua)
vim.lsp.enable({
  "lua_ls",
  "pyright",
  "ansiblels",
  "bashls",
  "gopls",
})

--- LSP keymaps and autocommands
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(ev)
    -- LSP keymaps (completion is handled by blink.cmp)
    local function map(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, desc = desc })
    end

    map('n', 'gd', vim.lsp.buf.definition, 'Go to definition')
    map('n', 'gD', vim.lsp.buf.declaration, 'Go to declaration')
    map('n', 'gr', vim.lsp.buf.references, 'Go to references')
    map('n', 'gi', vim.lsp.buf.implementation, 'Go to implementation')
    map('n', 'K', vim.lsp.buf.hover, 'Hover documentation')
    map('n', '<leader>rn', vim.lsp.buf.rename, 'Rename symbol')
    map('n', '<leader>ca', vim.lsp.buf.code_action, 'Code action')
    map('n', '[d', function() vim.diagnostic.jump({ count = -1 }) end, 'Previous diagnostic')
    map('n', ']d', function() vim.diagnostic.jump({ count = 1 }) end, 'Next diagnostic')
    map('n', '<leader>e', vim.diagnostic.open_float, 'Show diagnostic')
  end,
})
