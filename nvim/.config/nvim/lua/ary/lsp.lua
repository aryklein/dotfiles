--- LSP configuration for Neovim

-- This is copied straight from blink
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

-- Enable servers with specific overrides for Lua
vim.lsp.enable({
  "lua",
  "python",
  "ansible",
  "bash",
})

--- This file sets up the LSP client, key mappings, and autocommands for LSP features.
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})
